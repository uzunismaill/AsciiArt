import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

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
        ASCII_ART_MAP.put('I', new String[]{"IIIII", "  I  ", "  I  ", "  I  ", "IIIII"});
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
        ASCII_ART_MAP.put('Y', new String[]{"Y   Y", " Y Y ", "  Y  ", "  Y  ", "  Y  "});
        ASCII_ART_MAP.put('Z', new String[]{"ZZZZZ", "   Z ", "  Z  ", " Z   ", "ZZZZZ"});

        // Türkçe Karakterler
        ASCII_ART_MAP.put('Ç', new String[]{" ÇÇÇ ", "Ç    ", "Ç    ", "Ç ÇÇ ", " ÇÇÇ "});
        ASCII_ART_MAP.put('Ğ', new String[]{" GĞG ", "Ğ    ", "Ğ ĞĞĞ", "Ğ   Ğ", " GĞG "});
        ASCII_ART_MAP.put('İ', new String[]{"İİİİİ", "  İ  ", "  İ  ", "  İ  ", "İİİİİ"}); 
        ASCII_ART_MAP.put('Ö', new String[]{" ÖÖÖ ", "Ö   Ö", "Ö   Ö", "Ö   Ö", " ÖÖÖ "});
        ASCII_ART_MAP.put('Ş', new String[]{" ŞŞŞ ", "Ş    ", " ŞŞŞ ", "    Ş", " ŞŞŞ "});
        ASCII_ART_MAP.put('Ü', new String[]{"Ü   Ü", "Ü   Ü", "Ü   Ü", "Ü   Ü", " ÜÜÜ "});
        
        // Semboller ve Boşluk
        ASCII_ART_MAP.put('!', new String[]{"  !  ", "  !  ", "  !  ", "     ", "  !  "});
        ASCII_ART_MAP.put('?', new String[]{"???? ", "?   ?", "  ?? ", "     ", "  ?  "});
        ASCII_ART_MAP.put(' ', new String[]{"     ", "     ", "     ", "     ", "     "}); 
        
        // Varsayılan / Tanınmayan Karakter
        ASCII_ART_MAP.put('*', new String[]{ 
            "#####"," # # ","#####"," # # ","#####"
        });
    }

    private String getRenkKodu(String renkAdi) {
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
                System.err.println("HATA: Geçersiz renk. Beyaz kullanılıyor.");
                yield WHITE;
            }
        };
    }

    public void metniYazdir(String metin, String renkKodu) {
        String islenmisMetin = metin.toUpperCase()
                                   .replace('I', 'İ') // 'I'yı 'İ' ile değiştir
                                   .replace('İ', 'İ') 
                                   .replace('Ğ', 'Ğ')
                                   .replace('Ö', 'Ö')
                                   .replace('Ü', 'Ü')
                                   .replace('Ç', 'Ç')
                                   .replace('Ş', 'Ş');

        int satirSayisi = 5; 

        for (int i = 0; i < satirSayisi; i++) {
            StringBuilder satir = new StringBuilder();
            
            for (char karakter : islenmisMetin.toCharArray()) {
                String[] artDizisi = ASCII_ART_MAP.getOrDefault(karakter, ASCII_ART_MAP.get('*'));
                satir.append(artDizisi[i]);
                satir.append("  ");
            }
            
            System.out.println(renkKodu + satir.toString() + RESET);
        }
    }

    public static void main(String[] args) {
        ProfesyonelAsciiArt generator = new ProfesyonelAsciiArt();
        Scanner scanner = new Scanner(System.in);
        
        try {
            // Betik tarafından gönderilen metin ve renk girdilerini oku
            String kullaniciMesaji = scanner.nextLine();
            String kullaniciRenkAdi = scanner.nextLine();
            
            String secilenRenkKodu = generator.getRenkKodu(kullaniciRenkAdi);
            generator.metniYazdir(kullaniciMesaji, secilenRenkKodu);
            
        } catch (Exception e) {
            // Terminalde doğrudan çalıştırılırsa (betik olmadan) veya hata olursa
            System.err.println("Kullanım Hatası: Bu programın 'asciiart.sh' betiği ile çalıştırılması gerekir.");
            System.err.println("Örnek: ./asciiart.sh \"GITHUB\" \"mavi\"");
        } finally {
            scanner.close();
        }
    }
}
