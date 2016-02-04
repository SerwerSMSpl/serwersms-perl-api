#!/usr/bin/perl
#
# @Author SerwerSMS
# @Created 2016-01-29 11:39:22
#

package Templates{
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
        * List of templates
        * param array $params
        *      option string "sort" Values: name
        *      option string "order" Values: asc|desc
        * return array
        *      option array "items"
        *          option int "id"
        *          option string "name"
        *          option string "text"
    ';
    sub index {
        my $self = shift;
        my (%params) = @_;
        return $self->{parent}->call('templates/index',%params);
    };
    ''//'
        * Adding new template
        * 
        * param string $name
        * param string $text
        * return array
        *      option array
        *          option bool "success"
        *          option int "id"
    ';
    sub add {
        my $self = shift;
        my ($name,$text,%params) = @_;
        $params{'name'}  = $name;
        $params{'text'}  = $text;
        return $self->{parent}->call('templates/add',%params);
    };
    ''//'
        * Editing a template
        * 
        * param int $id
        * param string $name
        * param string $text
        * return array
        *      option bool "success"
        *      option int "id"
    ';
    sub edit {
        my $self = shift;
        my ($id,$name,$text,%params) = @_;
        $params{'id'}  = $id;
        $params{'name'}  = $name;
        $params{'text'}  = $text;
        return $self->{parent}->call('templates/edit',%params);
    };
    ''//'
        * Deleting a template
        * 
        * param int $id
        * return array
        *      option bool "success"
    ';
    sub delete {
        my $self = shift;
        my ($id,%params) = @_;
        $params{'id'}  = $id;
        return $self->{parent}->call('templates/delete',%params);
    };
    return 1; 
}