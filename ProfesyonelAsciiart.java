import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;
import java.util.Locale; // Locale sınıfını ekliyoruz

public class ProfesyonelAsciiArt {

    // Renk kodları için ANSI tanımları
    public static final String RESET = "\u001B[0m";
    public static final String BLACK = "\u001B[30m";
    public static final String RED = "\u001B[31m";
    public static final String GREEN = "\u001B[32m";
    public static final String YELLOW = "\u001B[33m";
    public static final String BLUE = "\u001B[34m";
    public static final String PURPLE = "\u001B[35m";
    public static final String CYAN = "\u001B[36m";
    public static final String WHITE = "\u001B[37m";

    private static final Map<Character, String[]> ASCII_ART_MAP = new HashMap<>();

    static {
        initializeAsciiArtMap();
    }

    private static void initializeAsciiArtMap() {
        // İngilizce Harfler (A-Z)
        ASCII_ART_MAP.put('A', new String[]{" AAA ", "A   A", "AAAAA", "A   A", "A   A"});
        ASCII_ART_MAP.put('B', new String[]{"BBBB ", "B   B", "BBBB ", "B   B", "BBBB "});
        ASCII_ART_MAP.put('C', new String[]{" CCC ", "C    ", "C    ", "C    ", " CCC "});
        ASCII_ART_MAP.put('D', new String[]{"DDD  ", "D  D ", "D   D", "D  D ", "DDD  "});
        ASCII_ART_MAP.put('E', new String[]{"EEEEE", "E    ", "EEEEE", "E    ", "EEEEE"});
        ASCII_ART_MAP.put('F', new String[]{"FFFFF", "F    ", "FFFF ", "F    ", "F    "});
        ASCII_ART_MAP.put('G', new String[]{" GGG ", "G    ", "G GGG", "G   G", " GGG "});
        ASCII_ART_MAP.put('H', new String[]{"H   H", "H   H", "HHHHH", "H   H", "H   H"});
        ASCII_ART_MAP.put('I', new String[]{"IIIII", "  I  ", "  I  ", "  I  ", "IIIII"}); // Noktasız I (Büyük)
        ASCII_ART_MAP.put('J', new String[]{"JJJJJ", "  J  ", "  J  ", "J J  ", " JJ  "});
        ASCII_ART_MAP.put('K', new String[]{"K  K ", "K K  ", "KK   ", "K K  ", "K  K "});
        ASCII_ART_MAP.put('L', new String[]{"L    ", "L    ", "L    ", "L    ", "LLLLL"});
        ASCII_ART_MAP.put('M', new String[]{"M   M", "MM MM", "M M M", "M   M", "M   M"});
        ASCII_ART_MAP.put('N', new String[]{"N   N", "NN  N", "N N N", "N  NN", "N   N"});
        ASCII_ART_MAP.put('O', new String[]{" OOO ", "O   O", "O   O", "O   O", " OOO "});
        ASCII_ART_MAP.put('P', new String[]{"PPPP ", "P   P", "PPPP ", "P    ", "P    "});
        ASCII_ART_MAP.put('R', new String[]{"RRRR ", "R   R", "RRRR ", "R R  ", "R  RR"});
        ASCII_ART_MAP.put('S', new String[]{" SSS ", "S    ", " SSS ", "    S", " SSS "});
        ASCII_ART_MAP.put('T', new String[]{"TTTTT", "  T  ", "  T  ", "  T  ", "  T  "});
        ASCII_ART_MAP.put('U', new String[]{"U   U", "U   U", "U   U", "U   U", " UUU "});
        ASCII_ART_MAP.put('V', new String[]{"V   V", "V   V", "V   V", " V V ", "  V  "}); // V harfi eklenmiştir.
        ASCII_ART_MAP.put('W', new String[]{"W   W", "W   W", "W W W", "W W W", " W W "}); // W harfi eklenmiştir.
        ASCII_ART_MAP.put('X', new String[]{"X   X", " X X ", "  X  ", " X X ", "X   X"}); // X harfi eklenmiştir.
        ASCII_ART_MAP.put('Y', new String[]{"Y   Y", " Y Y ", "  Y  ", "  Y  ", "  Y  "});
        ASCII_ART_MAP.put('Z', new String[]{"ZZZZZ", "   Z ", "  Z  ", " Z   ", "ZZZZZ"});
        
        // **HATA DÜZELTME:** ASCII Art dizilerindeki fazladan boşluklar temizlenmiştir.

        // Türkçe Karakterler (Türkçe harflerden birkaçı düzenlenmiştir)
        ASCII_ART_MAP.put('Ç', new String[]{" ÇÇÇ ", "Ç    ", "Ç    ", "Ç ÇÇ ", " ÇÇÇ "});
        ASCII_ART_MAP.put('Ğ', new String[]{" ĞĞĞ ", "Ğ    ", "Ğ ĞĞĞ", "Ğ   Ğ", " ĞĞĞ "});
        ASCII_ART_MAP.put('İ', new String[]{" I I ", "  I  ", "  I  ", "  I  ", " II I"}); // Noktalı İ (Büyük)
        ASCII_ART_MAP.put('Ö', new String[]{" ÖÖÖ ", "Ö   Ö", "Ö   Ö", "Ö   Ö", " ÖÖÖ "});
        ASCII_ART_MAP.put('Ş', new String[]{" ŞŞŞ ", "Ş    ", " ŞŞŞ ", "    Ş", " ŞŞŞ "});
        ASCII_ART_MAP.put('Ü', new String[]{"Ü   Ü", "Ü   Ü", "Ü   Ü", "Ü   Ü", " ÜÜÜ "});
        
        // Semboller ve Boşluk
        ASCII_ART_MAP.put('!', new String[]{"  !  ", "  !  ", "  !  ", "     ", "  !  "});
        ASCII_ART_MAP.put('?', new String[]{"???? ", "?   ?", "  ?? ", "     ", "  ?  "});
        ASCII_ART_MAP.put(' ', new String[]{"     ", "     ", "     ", "     ", "     "}); 
        
        // Varsayılan / Tanınmayan Karakter
        ASCII_ART_MAP.put('#', new String[]{ 
            "#####"," # # ","#####"," # # ","#####"
        });
    }

    private String getRenkKodu(String renkAdi) {
        // Switch ifadesi çok temiz. Dokunmaya gerek yok.
        return switch (renkAdi.toLowerCase()) {
            case "siyah" -> BLACK;
            case "kırmızı" -> RED;
            case "yeşil" -> GREEN;
            case "sarı" -> YELLOW;
            case "mavi" -> BLUE;
            case "mor" -> PURPLE;
            case "turkuaz" -> CYAN;
            case "beyaz" -> WHITE;
            default -> {
                System.err.println("HATA: Geçersiz renk ('" + renkAdi + "'). Beyaz kullanılıyor.");
                yield WHITE;
            }
        };
    }

    public void metniYazdir(String metin, String renkKodu) {
        // İyileştirme 1: Türkçe Locale kullanarak büyük harf çevrimi
        // Bu, 'i' -> 'İ' ve 'ı' -> 'I' çevirimlerini otomatikleştirir.
        String islenmisMetin = metin.toUpperCase(new Locale("tr", "TR"));
        
        // İyileştirme 2: Manuel replace zincirini temizleme/düzeltme
        // .replace('I', 'İ') yerine Locale kullanmak daha doğrudur.
        // Ancak toUpperCase(tr) 'ı'yı 'I'ya çevirir, bu yüzden 'I' için bir ASCII art olmalı.
        // initializeAsciiArtMap'ta 'I' artık noktasız I'nın büyük hali olarak tanımlı.
        
        // Gerekirse, henüz eşlenmemiş diğer karakterleri varsayılan karaktere yönlendirebiliriz.
        // for (int i = 0; i < islenmisMetin.length(); i++) {
        //     if (!ASCII_ART_MAP.containsKey(islenmisMetin.charAt(i))) {
        //         // Bu kısım getOrDefault sayesinde gereksizleşmiştir.
        //     }
        // }

        int satirSayisi = 5; 

        for (int i = 0; i < satirSayisi; i++) {
            StringBuilder satir = new StringBuilder();
            
            for (char karakter : islenmisMetin.toCharArray()) {
                // 'i' harfinin büyük hali 'İ'dir.
                // 'ı' harfinin büyük hali 'I'dır.
                // Bu harflerin her ikisi de haritada mevcut.

                // Tanınmayan karakterler için artık '#' (Varsayılan) kullanılıyor.
                String[] artDizisi = ASCII_ART_MAP.getOrDefault(karakter, ASCII_ART_MAP.get('#'));
                
                // artDizisi'nin geçerli bir satırı olup olmadığını kontrol et
                if (i < artDizisi.length) {
                    satir.append(artDizisi[i]);
                    satir.append("  "); // Karakterler arası boşluğu biraz azaltmak görsel olarak daha iyi olabilir.
                } else {
                    // Güvenlik için. Normalde bu 5'i geçmez.
                    satir.append("      ");
                }
            }
            
            System.out.println(renkKodu + satir.toString() + RESET);
        }
    }

    public static void main(String[] args) {
        ProfesyonelAsciiArt generator = new ProfesyonelAsciiArt();
        Scanner scanner = new Scanner(System.in);
        
        try {
            // Betik tarafından gönderilen metin ve renk girdilerini oku
            // Kullanıcıdan iki satır okumayı bekler.
            String kullaniciMesaji = scanner.nextLine();
            String kullaniciRenkAdi = scanner.nextLine();
            
            String secilenRenkKodu = generator.getRenkKodu(kullaniciRenkAdi);
            generator.metniYazdir(kullaniciMesaji, secilenRenkKodu);
            
        } catch (Exception e) {
            // Betik olmadan terminalden çalıştırılırsa veya G/Ç hatası olursa
            // Hata mesajı daha spesifik hale getirilmiştir.
            System.err.println("HATA: Girdi alınamadı. Program, komut satırı argümanlarını (metin ve renk)");
            System.err.println("stdin üzerinden sağlayan bir sarıcı betikle (ör: asciiart.sh) çalıştırılmalıdır.");
            System.err.println("Örnek: ./asciiart.sh \"MERHABA DÜNYA\" \"turkuaz\"");
        } finally {
            // scanner'ın kapatılması önemlidir.
            scanner.close();
        }
    }
}
