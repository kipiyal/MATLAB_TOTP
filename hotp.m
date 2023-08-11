function cout = hotp(K, C, N)
% K    : shared secret string between '0'-'F' 
% C    : 16 length counter string between '0'-'F'
% N    : value length
% cout : HOTP value
Digit = N;

if mod(length(K), 2) == 1
    Knum = hex2dec(reshape(['0' ; K(:)]', 2, [])');
else
    Knum = hex2dec(reshape(K(:), 2, [])');
end

if length(C) ~= 16
    error('Wrong counter range');
end

Cnum = hex2dec(reshape(C(:), 2, [])');

% HS = dec2bin(hex2dec([ ...
%     '1f'; '86'; '98'; '69'; ...
%     '0e'; '02'; 'ca'; '16'; ...
%     '61'; '85'; '50'; 'ef'; ...
%     '7f'; '19'; 'da'; '8e'; ...
%     '94'; '5b'; '55'; '5a'  ...
% ]), 8); % RFC 4226, Section 5.4
HS = dec2bin(hmacSHA1(Knum, Cnum));

Offset = bin2dec(HS(19 + 1, (4 : 7) + 1));
Sbits = [ ...
    HS(Offset + 0 + 1, (1 : 7) + 1), ...
    HS(Offset + 1 + 1, (0 : 7) + 1), ...
    HS(Offset + 2 + 1, (0 : 7) + 1), ...
    HS(Offset + 3 + 1, (0 : 7) + 1)  ...
];

Snum = bin2dec(Sbits);
cout = num2str(mod(Snum, 10 ^ Digit), ['%0' num2str(N) 'd']);

end