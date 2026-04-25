#!/bin/bash
#!/bin/bash
yum update -y
yum install httpd -y
systemctl start httpd
systemctl enable httpd
echo "Hello from RP world" > /var/www/html/index.htmlt