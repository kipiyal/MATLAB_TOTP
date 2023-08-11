K = '40176ABCF03F66D8B892'; % Base32 decoded 'IALWVPHQH5TNROES'
t = posixtime(datetime('now', 'TimeZone', 'UTC'));
N = 6;
for dt = -60 : 30 : 60
    disp(totp(K, t + dt, N));
end

% %% Case Others
% 
% K = 'B45BB7C2FDA42F0AB611'; % Base32 decoded 'WRN3PQX5UQXQVNQR'
% ts = 1297553958;
% N = 6; % pyotp/test.py
% disp(totp(K, ts, N));
% 
% K = 'FFFFFFFFFFFFFFFFFFFF'; % Base32 decoded '7777777777777777'
% ts = 1234 * 30;
% N = 6; % google-authenticator-android/../PasscodeGeneratorTest.java
% disp(totp(K, ts, N));
% 
% K = 'FFFFFFFFFFFFFFFFFFFF'; % Base32 decoded '7777777777777777'
% ts = 2 * 30;
% N = 6; % google-authenticator-android/../PasscodeGeneratorTest.java
% disp(totp(K, ts, N));
% 
% %% Case 1
% 
% K = '3132333435363738393031323334353637383930';
% t = datetime('1970-01-01 00:00:59');
% ts = posixtime(t);
% N = 8; % RFC 6238, Appendix B
% disp(totp(K, ts, N));
% 
% %% Case 2
% 
% K = '3132333435363738393031323334353637383930';
% t = datetime('2005-03-18 01:58:29');
% ts = posixtime(t);
% N = 8; % RFC 6238, Appendix B
% disp(totp(K, ts, N));
% 
% %% Case 3
% 
% K = '3132333435363738393031323334353637383930';
% t = datetime('2005-03-18 01:58:31');
% ts = posixtime(t);
% N = 8; % RFC 6238, Appendix B
% disp(totp(K, ts, N));
% %% Case 4
% 
% K = '3132333435363738393031323334353637383930';
% t = datetime('2009-02-13 23:31:30');
% ts = posixtime(t);
% N = 8; % RFC 6238, Appendix B
% disp(totp(K, ts, N));
% 
% %% Case 5
% 
% K = '3132333435363738393031323334353637383930';
% t = datetime('2033-05-18 03:33:20');
% ts = posixtime(t);
% N = 8; % RFC 6238, Appendix B
% disp(totp(K, ts, N));
% 
% %% Case 6
% 
% K = '3132333435363738393031323334353637383930';
% t = datetime('2603-10-11 11:33:20');
% ts = posixtime(t);
% N = 8; % RFC 6238, Appendix B
% disp(totp(K, ts, N));