function f = SendEmailFromMatlab ( target_mail )

% E.g., target_mail = 'yli3@ilstu.edu';

mail = 'someone@yahoo.com'; %Your Yahoo email address
password = 'abcd1234';  %Your Yahoo password as a string
setpref('Internet','SMTP_Server','smtp.mail.yahoo.com');
%% Gmail/Yahoo Servers:
setpref('Internet','E_mail',mail);
setpref('Internet','SMTP_Username',mail);
setpref('Internet','SMTP_Password',password);
props = java.lang.System.getProperties;
props.setProperty('mail.smtp.auth','true');
props.setProperty('mail.smtp.socketFactory.class', 'javax.net.ssl.SSLSocketFactory');
props.setProperty('mail.smtp.socketFactory.port','465');

savefile = datestr(now, 'HHMMmmmdd'); 
sendmail(target_mail,'Your data is ready to collect', savefile);

f = 'your email has been sent';
