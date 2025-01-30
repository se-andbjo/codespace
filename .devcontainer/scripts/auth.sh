# Check if the user is authenticated
if gcloud auth application-default print-access-token &> /dev/null; then
    echo "ADC login session is active."
else
    echo "ADC login session is invalid or expired."
    gcloud auth application-default login
fi