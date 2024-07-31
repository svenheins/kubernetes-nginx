export $(cat .env)

echo 'the deployment file looks like this: '
envsubst < deployment.yaml | cat -

# Prompt the user
read -p "Do you want to proceed? (y/n): " choice

# Process the response
case "$choice" in 
  y|Y ) 
    echo "Proceeding..."
    # Add your command here
    echo "kubectl apply -f deployment.yaml"
    envsubst < deployment.yaml | kubectl apply -f -
    echo "kubectl apply -f service.yaml"
    envsubst < service.yaml | kubectl apply -f -
    echo "kubectl apply -f ingress.yaml"
    envsubst < ingress.yaml | kubectl apply -f -
    ;;
  n|N ) 
    echo "Aborting..."
    ;;
  * ) 
    echo "Invalid input - use y or n"
    ;;
esac

