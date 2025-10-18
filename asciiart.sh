#!/bin/bash

# --- Ascii Art Kurulum Betiği ---

echo "--- Java ASCII Art Kurulumu Başlatılıyor ---"

# 1. Java dosyasının varlığını kontrol et
if [ ! -f "ProfesyonelAsciiArt.java" ]; then
    echo "HATA: ProfesyonelAsciiArt.java dosyası bulunamadı. Lütfen kontrol edin."
    exit 1
fi

echo "Java dosyası derleniyor..."

# 2. Java dosyasını derleme
javac ProfesyonelAsciiArt.java

# Derleme başarısızsa çık
if [ $? -ne 0 ]; then
    echo "HATA: Java derlemesi başarısız oldu."
    exit 1
fi

echo "Derleme başarılı."

# 3. Çalıştırılabilir betiği (asciiart.sh) oluşturma
echo '#!/bin/bash' > asciiart.sh
echo '# Java tabanlı ASCII Art programı için sarıcı betik (wrapper script)' >> asciiart.sh
echo '# Kullanım: ./asciiart.sh "metniniz" "renginiz"' >> asciiart.sh
echo '' >> asciiart.sh
echo 'metin=$1' >> asciiart.sh
echo 'renk=$2' >> asciiart.sh
echo '' >> asciiart.sh
echo '# Argüman kontrolü' >> asciiart.sh
echo 'if [ -z "$metin" ] || [ -z "$renk" ]; then' >> asciiart.sh
echo '    echo "Kullanım: $0 \"<metin>\" \"<renk>\""' >> asciiart.sh
echo '    echo "Örn: $0 \"JAVA KOD\" \"kırmızı\""' >> asciiart.sh
echo '    exit 1'
echo 'fi' >> asciiart.sh
echo '' >> asciiart.sh
echo '# Java programını çalıştırma (<< EOF ile argümanları stdin olarak gönderir)' >> asciiart.sh
echo 'java ProfesyonelAsciiArt << EOF' >> asciiart.sh
echo "$metin" >> asciiart.sh
echo "$renk" >> asciiart.sh
echo 'EOF' >> asciiart.sh

# 4. Yeni oluşturulan betiğe çalıştırma izni verme
chmod +x asciiart.sh

echo ""
echo "---------------------------------------------------------"
echo " ✅ KURULUM TAMAMLANDI!"
echo "Şimdi Python/Bash betiği gibi çalıştırabilirsiniz."
echo "---------------------------------------------------------"
echo "Kullanım Örneği:"
echo "./asciiart.sh \"TÜRKÇE DESTEK\" \"yeşil\""
echo "Desteklenen renkler: kırmızı, mavi, yeşil, sarı, mor, turkuaz, beyaz, siyah"
echo "---------------------------------------------------------"
