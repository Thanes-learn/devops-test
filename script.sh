# Create the resolver directory
sudo mkdir -v /etc/resolver

# Add your nameserver to resolvers
sudo bash -c 'echo "nameserver "$(minikube ip) > /etc/resolver/example.com'
sudo bash -c 'echo "domain example.com" >> /etc/resolver/example.com'
sudo bash -c 'echo "search_order 1" >> /etc/resolver/example.com'
sudo bash -c 'echo "timeout 5" >> /etc/resolver/example.com'

# Reload the mDNS
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.mDNSResponder.plist
sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.mDNSResponder.plist
sudo launchctl enable system/com.apple.mDNSResponder.reloaded
sudo launchctl disable system/com.apple.mDNSResponder.reloaded
# If you want to check the configuration, run
scutil --dns
