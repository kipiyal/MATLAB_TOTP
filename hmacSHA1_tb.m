%% Case 1
K = '0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B0B';
C = 'Hi There'; % RFC 2202, Section 3
Knum = hex2dec(reshape(K(:), 2, [])');
Cnum = C - '0' + '0';

disp(reshape(dec2hex(hmacSHA1(Knum, Cnum))', 1, []));

%% Case 2
K = 'Jefe';
C = 'what do ya want for nothing?'; % RFC 2202, Section 3
Knum = K - '0' + '0';
Cnum = C - '0' + '0';

disp(reshape(dec2hex(hmacSHA1(Knum, Cnum))', 1, []));

%% Case 3
K = 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA';
C = repmat('DD', 1, 50); % RFC 2202, Section 3
Knum = hex2dec(reshape(K(:), 2, [])');
Cnum = hex2dec(reshape(C(:), 2, [])');

disp(reshape(dec2hex(hmacSHA1(Knum, Cnum))', 1, []));

%% Case 4
K = '0102030405060708090A0B0C0D0E0F10111213141516171819';
C = repmat('CD', 1, 50); % RFC 2202, Section 3
Knum = hex2dec(reshape(K(:), 2, [])');
Cnum = hex2dec(reshape(C(:), 2, [])');

disp(reshape(dec2hex(hmacSHA1(Knum, Cnum))', 1, []));

%% Case 5
K = '0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C';
C = 'Test With Truncation'; % RFC 2202, Section 3
Knum = hex2dec(reshape(K(:), 2, [])');
Cnum = C - '0' + '0';

disp(reshape(dec2hex(hmacSHA1(Knum, Cnum))', 1, []));

%% Case 6
K = repmat('AA', 1, 80);
C = 'Test Using Larger Than Block-Size Key - Hash Key First'; % RFC 2202, Section 3
Knum = hex2dec(reshape(K(:), 2, [])');
Cnum = C - '0' + '0';

disp(reshape(dec2hex(hmacSHA1(Knum, Cnum))', 1, []));

%% Case 7
K = repmat('AA', 1, 80);
C = 'Test Using Larger Than Block-Size Key and Larger Than One Block-Size Data'; % RFC 2202, Section 3
Knum = hex2dec(reshape(K(:), 2, [])');
Cnum = C - '0' + '0';

disp(reshape(dec2hex(hmacSHA1(Knum, Cnum))', 1, []));
