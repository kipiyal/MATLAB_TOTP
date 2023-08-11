function cout = hmacSHA1(key, cin)
% key  : integer number key array between 0-255
% cin  : integer number input content array between 0-255
% cout : integer number output content array between 0-255

Algorithm = 'SHA-1';
md = java.security.MessageDigest.getInstance(Algorithm);

if max(key) >= 256 || min(key) < 0 || max(cin) >= 256 || min(cin) < 0
    error('Wrong input range');
end

if length(key) <= 64
    keyPad = [key(:) ; zeros(64 - length(key), 1)];
else
    md.update(key(:));
    keyDigest = md.digest();
    keySHA1 = typecast(keyDigest, 'uint8');
    
    keyPad = [double(keySHA1(:)) ; zeros(64 - length(keySHA1), 1)];
end

iPad = hex2dec('36') * ones(64, 1);
oPad = hex2dec('5C') * ones(64, 1);

iKeyPad = bitxor(keyPad, iPad, 'uint8');
oKeyPad = bitxor(keyPad, oPad, 'uint8');

md.update([iKeyPad ; cin(:)]);
iKeyPadCinDigest = md.digest();
iKeyPadCinSHA1 = typecast(iKeyPadCinDigest, 'uint8');

md.update([oKeyPad ; iKeyPadCinSHA1]);
oKeyPadCinDigest = md.digest();
oKeyPadCinSHA1 = typecast(oKeyPadCinDigest, 'uint8');

cout = oKeyPadCinSHA1;

end