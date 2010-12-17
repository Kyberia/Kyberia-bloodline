{* header *}{include file="1549864.tpl"}

{if $user_id eq false}
<center>{* loginbox *}{include
file="1549885.tpl"}</center><br><br>
{/if}
<center><h1> DarkAural's Controll pannel</h1>
alebo srat na to koho, hlavne je co to robi:-)
<hr>
<form method='post' action='/id/2233432'>
Spustenie recistracneho cronu manualne<br>
<input type='submit' value="cron_test" name='event'>
</form>

<hr>
<h3>Masterize</h3>
<form action='/id/2233432' method='post'>

<input type='text' name='userto' value='userID_to_masterize' />
<input type='text' name='nodeto' value='nodeID_where_to_masterize' />
<br>
  <label>ake prava?</label>
  <select name="privileg" id="privileg">
    <option value="master">master</option>
    <option value="execute">execute</option>
    <option value="access">access</option>
    <option value="ban">ban</option>
    <option value="silence">silence</option>
    <option value="">delete_set_permission</option>
  </select>
<br>Enter your password<br>
<input type='password' name='passpost' value='type_here_the_password' />
<br><br>
Write something why, for what and so on why do you masterize someone [will be added to the logz
<br><textarea name='comment' id='comment'></textarea>
<br><br>
a log ku tejto veci:: <a href='http://kyberia.sk/id/2058745'> TU</a><br>

<input type="submit" name="event" value="masterize" />
<hr>










{*footer*}{include file="1549377.tpl"}