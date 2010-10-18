#!/bin/sh

# Script na upravu uploadnutych obrazkov k nodes (backend k eventu configure_image_new #2105641)
# Spustane z CRONu cca raz za 2 - 5 minut

# Created & maintained by maniax

cd /storage/system/www-root/kyberia.sk/process-img

PREPARED_FILES=`ls prepared/`
CURRENT_DATE=`date`

for PREPARED_FILE in $PREPARED_FILES
do
  echo "[$CURRENT_DATE] Processing file: $PREPARED_FILE" >> process-img.log

  if [ `echo $PREPARED_FILE | grep .upload | wc -l` -eq 1 ]
  then
    echo "[$CURRENT_DATE] Skipping file..." >> process-img.log
    continue
  fi

  RQ_DIMENSIONS=`echo $PREPARED_FILE | cut -b 1-3`
  NODE_FILENAME=`echo $PREPARED_FILE | cut -b 5-`

  convert prepared/$PREPARED_FILE -coalesce -resize "$RQ_DIMENSIONSx$RQ_DIMENSIONS>" ready/$NODE_FILENAME

  rm -f prepared/$PREPARED_FILE

  TGT_PART1=`echo $NODE_FILENAME | cut -b 1`
  TGT_PART2=`echo $NODE_FILENAME | cut -b 2`

  mv ready/$NODE_FILENAME ../images/nodes/$TGT_PART1/$TGT_PART2/$NODE_FILENAME
  chgrp www ../images/nodes/$TGT_PART1/$TGT_PART2/$NODE_FILENAME
  chmod 664 ../images/nodes/$TGT_PART1/$TGT_PART2/$NODE_FILENAME

  echo "[$CURRENT_DATE] Finished file processing." >> process-img.log
done
