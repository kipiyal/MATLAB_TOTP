function cout = totp(K, t, N)
% K    : shared secret string between '0'-'F' 
% t    : seconds number from 
% N    : value length
% cout : HOTP value

T0 = 0;
X = 30;

T = floor((t - T0) / X);

% K = '3132333435363738393031323334353637383930';
% T = '0000000000000000'; % RFC 4226, Appendix D
cout = hotp(K, dec2hex(T, 16), N);

end