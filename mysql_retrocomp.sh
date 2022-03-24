mysql -u root -e "SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'NO_ZERO_IN_DATE,NO_ZERO_DATE',''));"
mysql -u root -e "SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));"

echo "$(date) Finished processing MySQL GLOBAL changes ..."
# End of Script
