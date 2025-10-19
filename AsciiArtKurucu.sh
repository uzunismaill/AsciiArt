#!/bin/bash

# --- Java ASCII Art Kurulum Betiği (setup.sh) ---
# Mevcut Java dosyasını derler ve sarıcı betik oluşturur.

echo "--- Java ASCII Art Kurulumu Başlatılıyor ---"

JAVA_FILE="ProfesyonelAsciiArt.java"
CLASS_NAME="ProfesyonelAsciiArt"
SCRIPT_NAME="asciiart.sh"

# 1. Java dosyasının varlığını kontrol et
if [ ! -f "$JAVA_FILE" ]; then
    echo "HATA: '$JAVA_FILE' dosyası bulunamadı. Lütfen kontrol edin."
    exit 1
fi

echo "Java dosyası derleniyor..."

# 2. Java dosyasını derleme
# -encoding UTF-8 eklenmiştir. Türkçe karakterler için önemlidir.
javac -encoding UTF-8 "$JAVA_FILE"

# Derleme başarısızsa çık
if [ $? -ne 0 ]; then
    echo "HATA: Java derlemesi başarısız oldu. Lütfen '$JAVA_FILE' dosyasındaki hataları kontrol edin."
    exit 1
fi

echo "Derleme başarılı. Sınıf dosyası ('$CLASS_NAME.class') oluşturuldu."

# 3. Çalıştırılabilir sarıcı betiği (asciiart.sh) oluşturma
# cat << EOF yapısı, sarıcı betiğin içeriğini güvenli bir şekilde oluşturur.
cat > "$SCRIPT_NAME" << EOF
#!/bin/bash

# Java tabanlı ASCII Art programı için sarıcı betik (wrapper script)
# Kullanım: ./$SCRIPT_NAME "<metin>" "<renk>"

metin="\$1"
renk="\$2"

# Argüman kontrolü
if [ -z "\$metin" ] || [ -z "\$renk" ]; then
    echo "Kullanım: \$0 \"<metin>\" \"<renk>\""
    echo "Örn: \$0 \"JAVA KOD\" \"kırmızı\""
    echo "Desteklenen renkler: siyah, kırmızı, yeşil, sarı, mavi, mor, turkuaz, beyaz"
    exit 1
fi

# Java programını çalıştırma
# Argümanları stdin'den gönderir
java $CLASS_NAME << INPUT_END
\$metin
\$renk
INPUT_END
EOF

# 4. Yeni oluşturulan betiğe çalıştırma izni verme
chmod +x "$SCRIPT_NAME"

echo ""
echo "---------------------------------------------------------"
echo " ✅ KURULUM TAMAMLANDI!"
echo "Şimdi programı doğrudan betik ile çalıştırabilirsiniz."
echo "---------------------------------------------------------"
echo "Kullanım Örneği:"
echo "./$SCRIPT_NAME \"TÜRKÇE DESTEK\" \"yeşil\""
echo "Desteklenen renkler: siyah, kırmızı, yeşil, sarı, mavi, mor, turkuaz, beyaz"
echo "---------------------------------------------------------"
