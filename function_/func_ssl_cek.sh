Domain=$1
status=$(echo | openssl s_client -connect "${Domain}:443" </dev/null 2>/dev/null | grep 'Verify return code:')

#echo $Abc

#LIST:"some string with a substring you want to match"

if echo "$status" | grep -q "Verify return code: 0"; then 
echo "X509_V_OK:ok";
elif echo "$status" | grep -q "Verify return code: 2"; then 
echo "X509_V_ERR_UNABLE_TO_GET_ISSUER_CERT:unabletogetissuercertificate"
elif echo "$status" | grep -q "Verify return code: 3"; then 
echo "X509_V_ERR_UNABLE_TO_GET_CRL:unabletogetcertificateCRL"
elif echo "$status" | grep -q "Verify return code: 4"; then 
echo "X509_V_ERR_UNABLE_TO_DECRYPT_CERT_SIGNATURE:unabletodecryptcertificate'ssignature"
elif echo "$status" | grep -q "Verify return code: 5"; then 
echo "X509_V_ERR_UNABLE_TO_DECRYPT_CRL_SIGNATURE:unabletodecryptCRL'ssignature"
elif echo "$status" | grep -q "Verify return code: 6"; then 
echo "X509_V_ERR_UNABLE_TO_DECODE_ISSUER_PUBLIC_KEY:unabletodecodeissuerpublickey"
elif echo "$status" | grep -q "Verify return code: 7"; then 
echo "X509_V_ERR_CERT_SIGNATURE_FAILURE:certificatesignaturefailure"
elif echo "$status" | grep -q "Verify return code: 8"; then 
echo "X509_V_ERR_CRL_SIGNATURE_FAILURE:CRLsignaturefailure"
elif echo "$status" | grep -q "Verify return code: 9"; then 
echo "X509_V_ERR_CERT_NOT_YET_VALID:certificateisnotyetvalid"
elif echo "$status" | grep -q "Verify return code: 10"; then 
echo "X509_V_ERR_CERT_HAS_EXPIRED:certificatehasexpired"
elif echo "$status" | grep -q "Verify return code: 11"; then 
echo "X509_V_ERR_CRL_NOT_YET_VALID:CRLisnotyetvalid"
elif echo "$status" | grep -q "Verify return code: 12"; then 
echo "X509_V_ERR_CRL_HAS_EXPIRED:CRLhasexpired"
elif echo "$status" | grep -q "Verify return code: 13"; then 
echo "X509_V_ERR_ERROR_IN_CERT_NOT_BEFORE_FIELD:formaterrorincertificate'snotBeforefield"
elif echo "$status" | grep -q "Verify return code: 14"; then 
echo "X509_V_ERR_ERROR_IN_CERT_NOT_AFTER_FIELD:formaterrorincertificate'snotAfterfield"
elif echo "$status" | grep -q "Verify return code: 15"; then 
echo "X509_V_ERR_ERROR_IN_CRL_LAST_UPDATE_FIELD:formaterrorinCRL'slastUpdatefield"
elif echo "$status" | grep -q "Verify return code: 16"; then 
echo "X509_V_ERR_ERROR_IN_CRL_NEXT_UPDATE_FIELD:formaterrorinCRL'snextUpdatefield"
elif echo "$status" | grep -q "Verify return code: 17"; then 
echo "X509_V_ERR_OUT_OF_MEM:outofmemory"
elif echo "$status" | grep -q "Verify return code: 18"; then 
echo "X509_V_ERR_DEPTH_ZERO_SELF_SIGNED_CERT:selfsignedcertificate"
elif echo "$status" | grep -q "Verify return code: 19"; then 
echo "X509_V_ERR_SELF_SIGNED_CERT_IN_CHAIN:selfsignedcertificateincertificatechain"
elif echo "$status" | grep -q "Verify return code: 20"; then 
echo "X509_V_ERR_UNABLE_TO_GET_ISSUER_CERT_LOCALLY:unabletogetlocalissuercertificate"
elif echo "$status" | grep -q "Verify return code: 21"; then 
echo "X509_V_ERR_UNABLE_TO_VERIFY_LEAF_SIGNATURE:unabletoverifythefirstcertificate"
elif echo "$status" | grep -q "Verify return code: 22"; then 
echo "X509_V_ERR_CERT_CHAIN_TOO_LONG:certificatechaintoolong"
elif echo "$status" | grep -q "Verify return code: 23"; then 
echo "X509_V_ERR_CERT_REVOKED:certificaterevoked"
elif echo "$status" | grep -q "Verify return code: 24"; then 
echo "X509_V_ERR_INVALID_CA:invalidCAcertificate"
elif echo "$status" | grep -q "Verify return code: 25"; then 
echo "X509_V_ERR_PATH_LENGTH_EXCEEDED:pathlengthconstraintexceeded"
elif echo "$status" | grep -q "Verify return code: 26"; then 
echo "X509_V_ERR_INVALID_PURPOSE:unsupportedcertificatepurpose"
elif echo "$status" | grep -q "Verify return code: 27"; then 
echo "X509_V_ERR_CERT_UNTRUSTED:certificatenottrusted"
elif echo "$status" | grep -q "Verify return code: 28"; then 
echo "X509_V_ERR_CERT_REJECTED:certificaterejected"
elif echo "$status" | grep -q "Verify return code: 29"; then 
echo "X509_V_ERR_SUBJECT_ISSUER_MISMATCH:subjectissuermismatch"
elif echo "$status" | grep -q "Verify return code: 30"; then 
echo "X509_V_ERR_AKID_SKID_MISMATCH:authorityandsubjectkeyidentifiermismatch"
elif echo "$status" | grep -q "Verify return code: 31"; then 
echo "X509_V_ERR_AKID_ISSUER_SERIAL_MISMATCH:authorityandissuerserialnumbermismatch"
elif echo "$status" | grep -q "Verify return code: 32"; then 
echo "X509_V_ERR_KEYUSAGE_NO_CERTSIGN:keyusagedoesnotincludecertificatesigning"
elif echo "$status" | grep -q "Verify return code: 50"; then 
echo "X509_V_ERR_APPLICATION_VERIFICATION:applicationverificationfailure"
else
  echo "no match";
  echo $status
fi