echo -n '                    _   
__      ____ _  ___| |_ 
\ \ /\ / / _` |/ _ \ __|
 \ V  V / (_| |  __/ |_ 
  \_/\_/ \__, |\___|\__|
         |___/          '
echo " "
read -p "Proxy türünü girin (socks4, socks5, http, https): " proxy_type
read -p "Timeout değerini girin (örn: 10000): " timeout
read -p "Ülkeyi girin (hepsi için all yazın): " country
read -p "Uptime değerini girin (örn: 0): " uptime
read -p "Hangi dosyaya kaydetmek istersiniz? : " file

wget -O "$file" "https://api.proxyscrape.com/?request=getproxies&proxytype=$proxy_type&timeout=$timeout&country=$country&uptime=$uptime"
sed -i 's/^/'"$proxy_type"':\/\//; s/:/:/' "$file"
cat "$file"
