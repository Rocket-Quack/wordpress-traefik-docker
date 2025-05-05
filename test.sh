#!/bin/sh
set -e

# Ohne HTTPS
echo "http://www.example.com"
curl -I http://www.example.com
echo "http://example.com"
curl -I http://example.com
echo "http://www.example.com/"
curl -I http://www.example.com/
echo "http://example.com/"
curl -I http://example.com/

# Mit HTTPS
echo "https://www.example.com"
curl -I https://www.example.com --insecure
echo "https://example.com"
curl -I https://example.com --insecure
echo "https://www.example.com/"
curl -I https://www.example.com/ --insecure
echo "https://example.com/"
curl -I https://example.com/ --insecure
