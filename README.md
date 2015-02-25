# HHH
Code and examples from Hungry Hungry Hackers (H3) challenge in 2012(?)
<img src="http://www.gtri.gatech.edu/files/media/logo_yellow_June2011-relatedinfo.png">

I won't distribute code or binaries directly from the H3 challenge, but I did come home after the challenge and write two example perl scripts that simulate two of the easier challenges.

findhex.pl - utility to help find hex based strings and weed out strings that contain characters outside [0-9a-f].  Useful for "strings binary.dat | perl findhex.pl".

graphic/writeencryptedbitmap.pl - utility to create a png file and then encrypt it.  The encryption algorithm used in the challenge is mirrored in this script, which makes it vulnerable because of its periodic nature.  Read about ECB from http://en.wikipedia.org/wiki/Block_cipher_mode_of_operation.  Example of unencrypted png in output.png

graphic/readencryptedbitmap.pl - utility to take an AES encrypted (in ECB mode) png file and attempt to turn it into a black and white png.  After the change of format the key is viewable (although not exceptionally clearly readable).  Example of processed png in output1.png

server/rand1.pl - TCP server that expects to be sent a number between 1 and 16,384.  If given the correct input the service will return the key.  This challenge was used at H3, but looks to have been bugged.  I was able to send all available inputs to the service and never received the key (as per searching thru a Wireshark capture of all responses)

