# SerwerSMS - Perl

Klient Perl do komunikacji zdalnej z API v2 SerwerSMS.pl

Uruchomienie
```perl 
    perl script.pl
```
lub

```perl 
    perl -e  'use lib "path_to_SerwerSMS.pm";use lib "path_to_lib_SerwerSMS"; use SerwerSMS;use JSON::XS;my $s = SerwerSMS->new("username","password");my %params = (test => 1);print $s->{'messages'}->sendSms("500600700","text","INFORMACJA",%params);';

```

Zalecane jest, aby komunikacja przez HTTPS API odbywała się z loginów utworzonych specjalnie do połączenia przez API. Konto użytkownika API można utworzyć w Panelu Klienta → Ustawienia interfejsów → HTTPS XML API → Użytkownicy.

Przykładowe wywołanie
```perl
        use lib "path_to_SerwerSMS.pm";
        use lib "path_to_lib_SerwerSMS";
        use SerwerSMS;
        use JSON::XS;
        use Try::Tiny;
        
        try {
            
            my $s = SerwerSMS->new("username","password");
            my %params = (
                test    => 1, 
                details => 1
            );
            print $s->{"messages"}->sendSms("500600700","text","INFORMACJA",%params);
            
        } catch {
                print "error: $_";
        };
```
Wysyłka SMS
```perl
    try {
            
        my $s = SerwerSMS->new("username","password");
        my %params = (details => 1);
        
        # SMS FULL
        
        print $s->{"messages"}->sendSms("500600700","text","INFORMACJA",%params);
        
        # SMS ECO
        
        print $s->{"messages"}->sendSms("500600700","text","",%params);
        
        # VOICE from text 
        
        $params{"text"} = "tresc";
        print $s->{"messages"}->sendVoice("500600700",%params);
        
        # MMS
        
        $params{"file_id"} = "1f9e980e87";
        print $s->{"messages"}->sendMms("500600700","title",%params);
        
    } catch {
            print "error: $_";
    };
```        
Wysyłka spersonalizowanych SMS
```perl
    try {
            
        my $s = SerwerSMS->new("username","password");
        my %params = ( details => 1 );
        my @messages = (
                   ["phone" => 500600700,"text" => "text1"], 
                   ["phone" => 500600700,"text" => "text2"], 
                   ["phone" => 500600700,"text" => "text3"]
        ); 
        print $s->{"messages"}->sendPersonalized(\@messages,"INFORMACJA",\%params);
        
    } catch {
            print "error: $_";
    };
```
Pobieranie raportów doręczeń
```perl
    try {
            
        my $s = SerwerSMS->new("username","password");
        my %params = ( "phone" => "500600700");
        print $s->{"messages"}->reports(%params);
        
    } catch {
            print "error: $_";
    };
```
Pobieranie wiadomości przychodzących
```perl
    try {
            
        my $s = SerwerSMS->new("username","password");
        my %params = ( "phone" => "500600700");
        print $s->{"messages"}->recived("full",%params);
        
    } catch {
            print "error: $_";
    };
```
## Wymagania

perl5 ver. 22

## Dokumentacja
http://dev.serwersms.pl