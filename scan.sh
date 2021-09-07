> result/ping_res/error.txt
> result/ping_res/pass.txt
> result/ssl_test/results.txt
DomainData=$(echo cat data.txt)
SslTestPass=$(echo cat result/ping_res/pass.txt)
SslTestError=$(echo cat result/ping_res/error.txt)
SucessPing=$(echo | wc -l result/ping_res/pass.txt|awk '{print $1;}')
FailedPing=$(echo | wc -l result/ping_res/error.txt|awk '{print $1;}')
TotalAll=$(echo | wc -l data.txt |awk '{print $1;}')+1


echo "Starting App..."
sleep 3
echo "ping Test Start"
$DomainData | sed -e 's/^/sh function_\/func_ping.sh \"/; s/$/\"/' | sh
echo "ping Test Complete"
echo "\n"
echo "***************************"
echo "Total Site: $(( $TotalAll )) \nPing Successful : $(( $(echo | wc -l result/ping_res/pass.txt|awk '{print $1;}') )) site \nPing Failed : $(( $(echo | wc -l result/ping_res/error.txt|awk '{print $1;}') ))"
echo "***************************"
sleep 3
echo "\n"
echo "Ssl Check Test Start"
$SslTestPass | sed -e 's/^/sh function_\/func_ssl.sh \"/; s/$/\"/' | sh
$SslTestError | sed -e 's/^/sh function_\/func_ssl.sh \"/; s/$/\"/' | sh
echo "Ssl Check Test Complete"
sleep 3
echo "Generate report ..."
SslIssue(){
    AllStatHttps=`cat result/ssl_test/results.txt | awk '{print ""$1""""$2""""$3""}'`
        echo ${AllStatHttps} 
}
SslIssue > .tmpSsl
cat  result/template_head.txt .tmpSsl result/template_fotter.txt > result_final.html
rm .tmpSsl
echo "Generate report Finish..."
exit 0



