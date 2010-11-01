#!/usr/bin/perl -w

# php indenter
#  Reformats your php source code
#
# $Id: phpindent,v 1.1 2002/05/20 12:54:03 weasel Exp $
#
#
# Depends: Parse::RecDescent
# 
#
# (c) 2002 Florian Reitmeir <squat@riot.org>
#          Peter Palfrader <peter@palfrader.org>
#
#     This program is free software; you can redistribute it and/or modify
#     it under the terms of the GNU General Public License as published by
#     the Free Software Foundation; either version 2 of the License, or
#     (at your option) any later version.
#     
#     This program is distributed in the hope that it will be useful,
#     but WITHOUT ANY WARRANTY; without even the implied warranty of
#     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#     GNU General Public License for more details.
#     
#     You should have received a copy of the GNU General Public License
#     along with this program; if not, write to the Free Software
#     Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
#
#
#
# Usage: phpindent < orig.php > new.php
#
#
# - It might corrupt your code
# - It might not even work at all
# - It does not understand all of php
# - It's damn slow (several hours for one of our 800 line examples on a gHz
#       CPU)
# - But it was fun to write and merely to test out Parse::RecDescent
#
# It was just a proof of concept - don't use it in production
#
# Did I mention it was slow?
#
#
# Q: So why did you write it?
# A: It was an ad hoc quick hack which went out of control but was
#    real fun.
#
# Q: So are there any real php indenters?
# A: We didn't find any which is why we tried this nonsense at all.
#    If you find any just let us know and we will link to them.
#
# Q: Will you improve this indenter/fix bugs I report?
# A: Probably not. But if you happen to have lots of time we would
#    welcome a patch or two.
#
# Q: You know your grammar sucks?
# A: yepp.
#

#######################################################################
package MyToken;

sub new
{
	my ($class, %args) = @_;
	bless \%args, $class;
}

#######################################################################
package MyBinaryOperator;
@ISA = qw( MyToken );

sub reprint
{
	my ($self) = @_;
	return
	sprintf "%s %s %s",
		$self->{left}->reprint(),
		$self->{'operator'},
		$self->{right}->reprint();
};

#######################################################################
package MyPostOperator;
@ISA = qw( MyToken );

sub reprint
{
	my ($self) = @_;
	return
	sprintf "%s %s",
		$self->{left}->reprint(),
		$self->{'operator'};
};

#######################################################################
package MyPreOperator;
@ISA = qw( MyToken );

sub reprint
{
	my ($self) = @_;
	return
	sprintf "%s %s",
		$self->{'operator'},
		$self->{right}->reprint();
};

#######################################################################
package MyAtom;
@ISA = qw( MyToken );

sub reprint
{
	my ($self) = @_;

	return
	sprintf "%s",
		$self->{'value'};
};

#######################################################################
package MyStatement;
@ISA = qw( MyToken );

sub reprint
{
	my ($self) = @_;

	return
	sprintf "%s;\n",
		$self->{'value'};
};

#######################################################################
package MyComment;
@ISA = qw( MyToken );

sub reprint
{
	my ($self, %args) = @_;
	my $il = $args{'indent'} || 1;
	my $i = "\t" x ($il -1 );

	my $value = $self->{'value'};
	$value =~ s,#\s*,# ,;
	$value =~ s,//\s*,\n\n$i// ,;
	return
		$value."\n";
};

#######################################################################
package MyCommentMultiLine;
@ISA = qw( MyToken );

sub reprint
{
	my ($self, %args) = @_;
    my $il = $args{'indent'}-1 || 0;
	my $i = "\t" x $il;

	my $value = $self->{'value'};
	$value =~ s,/\*\s*\n?,,;
	$value =~ s,\n?\s*\*/,,;
	my @lines = map { s/^\s*\*?[ \t]*/$i * /; $_ } split /\n/, $value;
	unshift @lines, "/*";
	push @lines, "$i */";
	
	return
	sprintf "%s\n",
		join ("\n", @lines)
};

#######################################################################
package MyCommentDoc;
@ISA = qw( MyToken );

sub reprint
{
	my ($self, %args) = @_;
    my $il = $args{'indent'}-1 || 0;
	my $i = "\t" x $il;

	my $value = $self->{'value'};
	$value =~ s,^/\*\*[ \t]*\n?,,;
	$value =~ s,\n?[ \t]*\*/$,,;
	$value =~ s/\t/        /g;
	my @lines = split /\n/, $value;

	my $maxwhitespace;
	for (@lines) {
		my ($leadwhitespace) = ($_ =~ /^(\s*)/);
		$maxwhitespace = (!defined ($maxwhitespace) || length($leadwhitespace) < $maxwhitespace) ?
			length($leadwhitespace) :
			$maxwhitespace;
	};
	my $leadwhitespace = " " x $maxwhitespace;
	@lines = map { s/^$leadwhitespace//; s/^/$i   /; $_ } @lines;

	unshift @lines, "/**";
	push @lines, "$i */";
	
	return
	sprintf "%s\n",
		join ("\n", @lines)
};

#######################################################################
package MyConditionalBlock;
@ISA = qw( MyToken );

sub reprint
{
	my ($self, %args) = @_;
    my $il = $args{'indent'} || 0;
	my $i = "\t" x $il;

	my $block = $self->{block}->reprint(indent => $il, noend=>1);
	if ($block =~ /^\s*\{/) {
		$block = "\t" x ($il-1) . $block;
		$isblock = 1;
	} else {
		$block = "\t" x ($il) . $block;
		$isblock = 0;
	};


	my $elseblock;
	if ($self->{type} eq 'ifelse') {
		$elseblock = $self->{elseblock}->reprint(indent => $il, noend=>1);
		if ($elseblock =~ /^\s*\{/) {
			$elseblock = "\t" x ($il-1) . $elseblock;
			$elseisblock = 1;
		} else {
			$elseblock = "\t" x ($il) . $elseblock;
			$elseisblock = 0;
		};
	};

	if ($self->{type} eq 'if' || $self->{type} eq 'while') {
		return
			$self->{type}.
			" (".
			$self->{condition}->reprint().
			")\n".
			$block.
			($isblock ? ";\n" : "");
	} elsif ($self->{type} eq 'ifelse') {
		return
			"if".
			" (".
			$self->{condition}->reprint().
			")\n".
			$block.
			($elseisblock ? "\n" : "").
			"\t"x($il-1)  .  "else\n".
			$elseblock.
			($elseisblock ? ";\n" : "");
	} elsif ($self->{type} eq 'dowhile') {
		return
			"do\n".
			$block.
			" while (".
			$self->{condition}->reprint().
			");\n";
	} elsif ($self->{type} eq 'for') {
		return
			$self->{type}.
			" (".
			$self->{part1}->reprint().
			"; ".
			$self->{part2}->reprint().
			"; ".
			$self->{part3}->reprint().
			")\n".
			$block.
			($isblock ? ";\n" : "");
	} elsif ($self->{type} eq 'foreach') {
		return
			$self->{type}.
			" (".
			$self->{part1}->reprint().
			" as ".
			$self->{part2}->reprint().
			")\n".
			$block.
			($isblock ? ";\n" : "");
	};
	
};

#######################################################################
package MyParam;
@ISA = qw( MyToken );

sub reprint
{
	my ($self, %args) = @_;
	my $il = $args{'indent'} || 1;
	my $i = "\t" x $il;

	my $statements = join (", ", map { $_->reprint() } @{$self->{'statements'}});

	return
		$statements;
};

#######################################################################
package MyFunction;
@ISA = qw( MyToken );

sub reprint
{
	my ($self, %args) = @_;
	my $il = $args{'indent'} || 1;
	my $i = "\t" x $il;

	return
		$self->{name}->reprint().
		" (".
		((defined $self->{params}) ? $self->{params}->reprint() : "").
		")";
};

#######################################################################
package MyBlock;
@ISA = qw( MyToken );

sub reprint
{
	my ($self, %args) = @_;
	my $il = $args{'indent'} || 1;
	my $i = "\t" x $il;

	my $statements = join ($i, map { $_->reprint(indent => $il + 1) } @{$self->{'statements'}});

	$statements = $i.$statements if ( substr($statements,0,1) ne "\n" );
	
	return
		((defined $args{'nobraces'}) ? "" : "{\n").
		$statements.
		"\t" x ($il-1).
		((defined $args{'nobraces'}) ? "" : "}").
		((defined $args{'noend'}) ? "" : ";\n");
};

#######################################################################
package MyFunctionDefinition;
@ISA = qw( MyToken );

sub reprint
{
	my ($self, %args) = @_;

	my $il = $args{'indent'} || 1;
	my $i = "\t" x ($il-1);

	return
		"\n".
		$i."function ".
		$self->{'header'}->reprint().  "\n".
		$i.$self->{'block'}->reprint(indent => $il)."\n";
};




#######################################################################
package main;

use strict;
use Parse::RecDescent;


my $input;
local $/ = undef;
$input = <>;

my $grammar = q
{
	Script:				/<\?(php)?/ Block '?>'		{ MyAtom->new ( value => "<?\n" . $item[2]->reprint(nobraces=>1) ."?>\n" ) }

	GroupedBlock:		'{'	Block '}' /;?/			{ MyBlock->new ( statements => [ @{$item[2]->{'statements'}} ] ) }

	Block:				Statement Block			{ MyBlock->new ( statements => [ $item[1], @{$item[2]->{'statements'}} ] ) }
					|	Statement				{ MyBlock->new ( statements => [ $item[1] ] ) }

	Statement:			Expression ';'			{ MyStatement->new ( value => $item[1]->reprint() ) }
					|	';'						{ MyStatement->new ( value => '' ) }
					|	GroupedBlock ';'		{ $item[1] }
					|	GroupedBlock
					|	Comment
					|	IfThenElseBlock
					|	IfBlock
					|	WhileBlock
					|	DoWhileBlock
					|	ForLoop
					|	ForEachLoop
					|	FunctionDefinition

	FunctionDefinition:	"function" FunctionCall GroupedBlock
													{ MyFunctionDefinition->new ( header => $item[2], block => $item[3] ) }


	IfThenElseBlock:	"if" "(" Expression ")" Statement "else" Statement
												{ MyConditionalBlock->new ( type      => 'ifelse',
												                            condition => $item[3],
												                            block   => $item[5],
												                            elseblock => $item[7] ) }
	IfBlock:			"if" "(" Expression ")" Statement
												{ MyConditionalBlock->new ( type      => 'if',
												                            condition => $item[3],
												                            block     => $item[5] ) }
	WhileBlock:			"while" "(" Expression ")" Statement
												{ MyConditionalBlock->new ( type      => 'while',
												                            condition => $item[3],
												                            block     => $item[5] ) }
	DoWhileBlock:		"do" GroupedBlock "while" "(" Expression ")" ";"
												{ MyConditionalBlock->new ( type      => 'dowhile',
												                            condition => $item[5],
												                            block     => $item[2] ) }
	ForLoop:			"for" "(" Expression ";" Expression ";" Expression ")" Statement
												{ MyConditionalBlock->new ( type      => 'for',
												                            part1     => $item[3],
												                            part2     => $item[5],
												                            part3     => $item[7],
												                            block     => $item[9] ) }
	ForEachLoop:		"foreach" "(" Expression "as" Expression ")" Statement
												{ MyConditionalBlock->new ( type      => 'foreach',
												                            part1     => $item[3],
												                            part2     => $item[5],
												                            block     => $item[7] ) }
	Expression:			"(" Expression ")"		{ $item[2] }
					|	FunctionCall Operator Expression
												{ MyBinaryOperator->new ( left=>$item[1], operator=>$item[2], right=>$item[3] ) }
					|	Atom Operator Expression
												{ MyBinaryOperator->new ( left=>$item[1], operator=>$item[2], right=>$item[3] ) }
					|	Atom Operator			{ MyPostOperator->new ( left=>$item[1], operator=>$item[2] ) }
					|	PreOperator Expression	{ MyPreOperator->new ( right=>$item[2], operator=>$item[1] ) }
					|	FunctionCall
					|	Atom

												
	Comment:			CommentHash
					|	CommentSlash
					|	CommentDoc
					|	CommentMultiLine

	CommentHash:		/#.*?$/m				{ MyComment->new ( value => $item[1] ) }
	CommentSlash:		/\/\/.*?$/m				{ MyComment->new ( value => $item[1] ) }
	CommentDoc:			/\/\*\*.*?\*\//s		{ MyCommentDoc->new ( value => $item[1] ) }
	CommentMultiLine:	/\/\*.*?\*\//s			{ MyCommentMultiLine->new ( value => $item[1] ) }

	Operator:			 '==='
					|	'!=='
					|	'+='
					|	'-='
					|	'=='
					|	'!='
					|	'=>'
					|	'<='
					|	'>='
					|	'++'
					|	'--'
					|	'&&'
					|	'.='
					|	'||'
					|	'&'
					|	'|'
					|	'>'
					|	'<'
					|	'='
					|	'/'
					|	'+'
					|	'-'
					|	'*'
					|	'.'
					|	':'
					|	'?'

	PreOperator: 		"new"
					|	"print"
					|	"return"
					|	"echo"
					|	"not"
					|	"++"
					|	"--"
					|	"-"
					|	"+"
					|	"1"
					|	"!"



	FunctionCall:		Atom "(" FunctionParameter ")"
												{ MyFunction->new ( name => $item[1], params => $item[3] ) }
					|	Atom "(" ")"
												{ MyFunction->new ( name => $item[1] ) }

	Atom:				Variable
					|	String
					|	Identifier
					|	Numerical


	FunctionParameter:	Expression "," FunctionParameter
												{ MyParam->new ( statements => [ $item[1], @{$item[3]->{'statements'}} ] ) }
					|	Expression				{ MyParam->new ( statements => [ $item[1] ] ) }

	
	Variable:			'$'	Identifier Array
												{ MyAtom->new ( value => '$'.$item[2]->reprint() . $item[3]->reprint() ) }
					|	'$' Identifier			{ MyAtom->new ( value => '$'.$item[2]->reprint() ) }


	Array:				"[" "]" Array			{ MyAtom->new ( value => '[]'.$item[3]->reprint() ) }
					|	"[" Expression "]" Array
												{ MyAtom->new ( value => '['.$item[2]->reprint().']'.$item[4]->reprint() ) }
					|	"[" Expression "]"		{ MyAtom->new ( value => '['.$item[2]->reprint().']' ) }
					|	"[" "]"					{ MyAtom->new ( value => '[]' ) }


	Identifier:			SimpleIdentifier "->" Identifier
												{ MyAtom->new ( value => $item[1]->reprint() ."->" .$item[3]->reprint() ) }
					|	SimpleIdentifier

	SimpleIdentifier:	/[a-zA-Z][a-zA-Z0-9_]*/	{ MyAtom->new ( value => $item[1] ) }

	Numerical:			/[\d]+(\.[\d+])?/		{ MyAtom->new ( value => $item[1] ) }

	String:				EmptyDQString
					|	NotEmptyDQString
					|	EmptySQString
					|	NotEmptySQString
	NotEmptyDQString:		/".*?[^\\\\]"/s		{ MyAtom->new ( value => $item[1] ) }
	EmptyDQString:		'""'					{ MyAtom->new ( value => '""' ) }
	NotEmptySQString:		/'.*?[^\\\\]'/s		{ MyAtom->new ( value => $item[1] ) }
	EmptySQString:		"''"					{ MyAtom->new ( value => "''" ) }
};

#$::RD_HINT = 1;
my $parser = new Parse::RecDescent ($grammar);
my $tree = $parser->Script($input);

print $tree->reprint();



# vim:set ts=4:
# vim:set shiftwidth=4:
