*DOMAIN
webtob1

*NODE
%SERVERNAME%	WEBTOBDIR="%WEBTOBDIR%",
                SHMKEY = 54000,
                DOCROOT="%WEBTOBDIR%/docs",
                PORT = "8080",
                HTH = %HTH_COUNT%,
                #Group = "nobody",
                #User = "nobody",
                NODENAME = "$(NODENAME)",
		ERRORDOCUMENT = "400,401,402,403,404,405,500,503",
		UpperDirRestrict=Y,
		ServiceOrder = "uri,ext",
            	METHOD = "GET, POST, -HEAD, -OPTIONS",
		Options = "ExcludeAllowHeaderOnError",
		RPAFHeader = "X-Forwarded-For",
                #JSVPORT = 9900,
                IPCPERM = 0777,
		LOGPERM = 0600,
                LOGGING = "acc_node",
                ERRORLOG = "err_node",
                SYSLOG = "syslog"

*HTH_THREAD
hth_worker
                SendfileThreads = 4,
                AccessLogThread = Y,
                #ReadBufSize=1048576, #1M
                #HtmlsCompression="text/html",
                SendfileThreshold=0,
                WorkerThreads=8

*VHOST
%SERVICENAME%	DOCROOT = "%APP_DOCROOT%",
                PORT = "%SERVICE_PORT%",
                HOSTNAME = "127.0.0.1",
                HostAlias = "*",
		ServiceOrder = "uri,ext",
		ERRORDOCUMENT = "400,401,402,403,404,405,500,503",
		METHOD = "GET, POST, -HEAD, -OPTIONS",
                LOGGING = "acc_%SERVICENAME%",
                ERRORLOG = "err_%SERVICENAME%"

*URI
u_%SERVICENAME%      URI = "/", Svrtype = HTML, VhostName="%SERVICENAME%"

*REVERSE_PROXY
rp_%SERVICENAME%     VhostName="%SERVICENAME%",
                PathPrefix="/",
                ServerPathPrefix="/",
                ServerAddress="%JEUS_DOMAIN%",
                Options = "DynamicServerAddress"
#		RegExp="!\.(html|png)$",
#               Options = "TTLResolveDNS",
#		MinPersistentServerConnections=100,
#		MaxPersistentServerConnections=100,
#		ConnectRetryCount=3,
#		ConnectTimeout=10,
#		PersistentServerCheckUrl="jeus.jsp"

*LOGGING
syslog          Format = "SYSLOG",   FileName = "%WEBTOBLOGHOME%/syslog/system.log_%M%%D%%Y%", Option = "sync"
acc_node        Format = "COMBINED", FileName = "%WEBTOBLOGHOME%/node/access.log_%M%%D%%Y%", Option = "sync"
err_node        Format = "ERROR",    FileName = "%WEBTOBLOGHOME%/node/error.log_%M%%D%%Y%", Option = "sync"
acc_%SERVICENAME%        Format = "COMBINED", FileName = "%WEBTOBLOGHOME%/%SERVICENAME%/access.log_%M%%D%%Y%", Option = "sync"
err_%SERVICENAME%        Format = "ERROR",    FileName = "%WEBTOBLOGHOME%/%SERVICENAME%/error.log_%M%%D%%Y%", Option = "sync"


*ERRORDOCUMENT
400		status = 400, url = "/error.html"
401		status = 401, url = "/error.html"
402		status = 402, url = "/error.html"
403		status = 403, url = "/error.html"
404		status = 404, url = "/error.html"
405		status = 405, url = "/error.html"
500     	status = 500, url = "/error.html"
503		status = 503, url = "/error.html"

*EXT
htm		MimeType = "text/html", SvrType = HTML
html		MimeType = "text/html", SvrType = HTML
#jsp		MimeType = "application/jsp", SvrType = JSV, Options = "unset"
css		MimeType = "text/css", SvrType = HTML
htc		MimeType = "text/x-component", SvrType = HTML
js		MimeType = "application/x-javascript", SvrType = HTML
txt		MimeType = "text/plain", SvrType = HTML
ico		MimeType = "image/x-icon", SvrType = HTML
gif		MimeType = "image/gif", SvrType = HTML
jpg		MimeType = "image/jpeg", SvrType = HTML
png		MimeType = "image/png", SvrType = HTML
swf		MimeType = "application/x-shockwave-flash", SvrType=HTML
doc		MimeType = "application/msword", SvrType = HTML
hwp		MimeType = "application/x-hwp", SvrType = HTML
pdf		MimeType = "application/pdf", SvrType = HTML
ppt		MimeType = "application/vnd.ms-powerpoint", SvrType = HTML
xls		MimeType = "application/vnd.ms-excel", SvrType = HTML
exe		MimeType = "application/octet-stream", SvrType = HTML
dll		MimeType = "application/x-msdownload", SvrType = HTML
cab		MimeType = "application/x-compressed", SvrType = HTML
ini		MimeType = "application/octet-stream",  SvrType = HTML
ocx		MimeType = "application/x-pe-win32-x86",    SVRTYPE = HTML
asf		MimeType = "video/x-ms-asf", SvrType = HTML
avi		MimeType = "video/x-msvideo", SvrType = HTML
mov		MimeType = "video/quicktime", SvrType = HTML
mpeg		MimeType = "video/mpeg", SvrType = HTML
mpg		MimeType = "video/mpeg", SvrType = HTML
wma		MimeType = "audio/x-ms-wma", SvrType = HTML
wmv		MimeType = "audio/x-ms-wmv", SvrType = HTML 
tar		MimeType = "application/x-tar", SvrType = HTML
zip		MimeType = "application/zip", SvrType = HTML
alz		MimeType = "application/zip", SvrType = HTML
eot		MimeType = "application/vnd.ms-fontobject", SvrType = HTML
otf		MimeType = "application/font-sfnt", SvrType = HTML
ttf		MimeType = "application/font-sfnt", SvrType = HTML
woff		MimeType = "application/font-woff", SvrType = HTML
svg		MimeType = "image/svg+xml", SvrType = HTML
xhtml		MimeType = "application/xhtml+xml", SvrType = HTML
xml		MimeType = "application/xml", SvrType = HTML
docx		MimeType = "application/vnd.openxmlformats-officedocument.wordprocessingml.document", SvrType = HTML
xlsx		MimeType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", SvrType = HTML
pptx		MimeType = "application/vnd.openxmlformats-officedocument.presentationml.presentation", SvrType = HTML
