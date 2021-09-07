url="$1"

# Get the port after symbol :, if does not exist use the default port 443
port=$(echo "${url}" | awk -F':' '{ print $3 }')

if [ -z "${port}" ]; then
   port="443"
fi

# Get the final hostname because this URL might be redirected
final_hostname=$(timeout 1.2 curl "${url}" -Ls -o /dev/null -w %{url_effective} | awk -F[/:] '{ print $4 }')

# Use openssl to get the status of the host

status=$(timeout 3.2 echo | openssl s_client -connect "${final_hostname}:${port}" </dev/null 2>/dev/null | grep 'Verify return code: 0 (ok)')

if [ -n "${status}" ]; then
   echo "<tr><td>${final_hostname}</td><td>Site_${final_hostname}_with_port_${port}_is_valid_https</td><td>$(sh function_/func_ssl_cek.sh "${url}")</td></tr>" >> result/ssl_test/results.txt
else
   echo "<tr><td>${final_hostname}</td><td>Site_${final_hostname}_with_port_${port}_is_not_valid_https</td><td>$(sh function_/func_ssl_cek.sh "${url}")</td></tr>" >> result/ssl_test/results.txt
fi