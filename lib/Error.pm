#!/usr/bin/perl
#
# @Author SerwerSMS
# @Created 2016-01-29 11:39:22
#

package Error{
    use strict;
    use warnings;
    use JSON::XS;
    
    my $serwersms;
    sub new{
       
        my $class = shift;
        my $self = { @_ };
        
        $serwersms = $self->{parent}; 
        bless $self, $class;
        
        return $self;
    };
    ''//'
        * Preview error
        * 
        * param int $code
        * return array
        *      @option int "code"
        *      @option string "type"
        *      @option string "message"
    ';
    sub view {
        my $self = shift;
        my ($code,%params) = @_;
        
        return $self->{parent}->call('error/'.$code);
    };
    return 1; 
}