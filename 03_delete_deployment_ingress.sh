export $(cat .env)

echo 'the deployment file looks like this: '
envsubst < deployment.yaml | cat -

# Prompt the user
read -p "Do you want to proceed DELETING the deployment and ingress? (y/n): " choice

# Process the response
case "$choice" in 
  y|Y ) 
    echo "Proceeding..."
    # Add your command here
    echo "kubectl delete -f deployment.yaml"
    envsubst < deployment.yaml | kubectl delete -f -
    echo "kubectl delete -f service.yaml"
    envsubst < service.yaml | kubectl delete -f -
    echo "kubectl delete -f ingress.yaml"
    envsubst < ingress.yaml | kubectl delete -f -
    ;;
  n|N ) 
    echo "Aborting..."
    ;;
  * ) 
    echo "Invalid input - use y or n"
    ;;
esac

