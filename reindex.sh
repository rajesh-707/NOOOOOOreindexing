#!/bin/bash
#touch log_upscaled_`date "+%Y%m%d_%H.%M"`.txt
cat /dev/null >log_upscaled_*
touch log_upscaled_`date "+%Y%m%d"`.txt
cd /usr/share/nginx/html/
echo " ------ Start of Re-Indexing job at ---------"
touch log_upscaled_`date "+%Y%m%d"`.txt
date >> log_upscaled_`date "+%Y%m%d"`.txt
start=$(date +%Y-%m-%d.%H:%M:%S) >>log_upscaled_`date "+%Y%m%d"`.txt
echo " ----- Start of Indexing with upscaled jobs ---------" >>log_upscaled_`date "+%Y%m%d"`.txt
 echo " Runnign Job indexer:reset:  " >> log_upscaled_`date "+%Y%m%d"`.txt
 time php bin/magento indexer:reset >>log_upscaled_`date "+%Y%m%d"`.txt
 echo "Start time Indexing of job at :"  >>log_upscaled_`date "+%Y%m%d"`.txt
 date >>log_upscaled_`date "+%Y%m%d"`.txt
 sleep 2;


date
php bin/magento indexer:reindex >>log_upscaled_`date "+%Y%m%d"`.txt


date
 echo "--- All Indexing jobs are done -- " >>log_upscaled_`date "+%Y%m%d"`.txt
 echo " -----End Time of finishing all indexing : " >>log_upscaled_`date "+%Y%m%d"`.txt
 date >>log_upscaled_`date "+%Y%m%d"`.txt

end=$(date +%Y-%m-%d.%H:%M:%S) >>log_upscaled_`date "+%Y%m%d"`.txt

echo "|--- Duration details Re-indexing job ----|"  >>log_upscaled_`date "+%Y%m%d"`.txt
echo "Start time :" $start  >>log_upscaled_`date "+%Y%m%d"`.txt
echo "End time   :" $end    >>log_upscaled_`date "+%Y%m%d"`.txt
echo "|_________________________________________|"  >>log_upscaled_`date "+%Y%m%d"`.txt


echo "Re-indexing done with upscalled " `date`| sendmail rajesh.shisodiya@gspann.com
sleep 3;
sendmail rajesh.shisodiya < log_upscaled_`date "+%Y%m%d"`.txt
