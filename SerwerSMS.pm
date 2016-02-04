#!/usr/bin/perl
#
# @File SerwerSMS.pm
# @Author SerwerSMS
# @Created 2016-01-29 11:39:22
#



package SerwerSMS{  
    
    use JSON::XS;
    use HTTP::Request;
    use LWP::UserAgent;
    use lib "lib";
    use Messages;
    use Account;
    use Blacklist;
    use Contacts;
    use Error;
    use Files;
    use Groups;
    use Payments;
    use Phones;
    use Premium;
    use Senders;
    use Stats;
    use Subaccounts;
    use Templates;
   
    my $username;
    my $password;
    my $api_url = 'https://api2.serwersms.pl/';
    my $format = 'json';

    sub new{
        my ($class, $login,$passwd) = @_;
        
        $username = $login;
        $password = $passwd;
        
        my $self = {};
        $self->{messages}   = Messages->new(parent => $self);
        $self->{account}    = Account->new(parent => $self);
        $self->{blacklist}  = Blacklist->new(parent => $self);
        $self->{contacts}   = Contacts->new(parent => $self);
        $self->{error}      = Error->new(parent => $self);
        $self->{files}      = Files->new(parent => $self);
        $self->{groups}     = Groups->new(parent => $self);
        $self->{payments}   = Payments->new(parent => $self);
        $self->{phones}     = Phones->new(parent => $self);
        $self->{premium}    = Premium->new(parent => $self);
        $self->{senders}    = Senders->new(parent => $self);
        $self->{stats}      = Stats->new(parent => $self);
        $self->{subaccounts}= Subaccounts->new(parent => $self);
        $self->{templates}  = Templates->new(parent => $self);

        bless $self, $class;
        return $self;
    }
    sub call {
        
        my $self = shift;
        my ($url, %params) = @_;
        $params{'username'}  = $username;
        $params{'password'}  = $password;
        my $uri = $api_url.$url;
        my $json = encode_json \%params;
        
        my $req = HTTP::Request->new(POST => $uri);
        $req->content_type('application/json');
        $req->content($json);

        my $ua = LWP::UserAgent->new;
        my $response = $ua->request($req);
        if ( $response->is_success() ){
            
            return $response->decoded_content;
        }
        else{
            print("ERROR: " . $response->status_line());
        }
    }
    
    return 1; 
}