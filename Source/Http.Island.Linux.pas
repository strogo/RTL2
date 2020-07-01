﻿namespace RemObjects.Elements.RTL;

{$IF ISLAND AND LINUX}
{$GLOBALS ON}
{$HIDE CPW7}
{$HIDE CPW8}

interface

type
  CurlException = public class(Exception) end;
  CURLCode = public enum (
    CURLE_OK = 0, CURLE_UNSUPPORTED_PROTOCOL, CURLE_FAILED_INIT, CURLE_URL_MALFORMAT, CURLE_NOT_BUILT_IN,
    CURLE_COULDNT_RESOLVE_PROXY, CURLE_COULDNT_RESOLVE_HOST, CURLE_COULDNT_CONNECT, CURLE_FTP_WEIRD_SERVER_REPLY,
    CURLE_REMOTE_ACCESS_DENIED, CURLE_FTP_ACCEPT_FAILED, CURLE_FTP_WEIRD_PASS_REPLY, CURLE_FTP_ACCEPT_TIMEOUT,
    CURLE_FTP_WEIRD_PASV_REPLY, CURLE_FTP_WEIRD_227_FORMAT, CURLE_FTP_CANT_GET_HOST, CURLE_HTTP2,
    CURLE_FTP_COULDNT_SET_TYPE, CURLE_PARTIAL_FILE, CURLE_FTP_COULDNT_RETR_FILE, CURLE_OBSOLETE20, CURLE_QUOTE_ERROR,
    CURLE_HTTP_RETURNED_ERROR, CURLE_WRITE_ERROR, CURLE_OBSOLETE24, CURLE_UPLOAD_FAILED, CURLE_READ_ERROR, CURLE_OUT_OF_MEMORY,
    CURLE_OPERATION_TIMEDOUT, CURLE_OBSOLETE29, CURLE_FTP_PORT_FAILED, CURLE_FTP_COULDNT_USE_REST, CURLE_OBSOLETE32,
    CURLE_RANGE_ERROR, CURLE_HTTP_POST_ERROR, CURLE_SSL_CONNECT_ERROR, CURLE_BAD_DOWNLOAD_RESUME, CURLE_FILE_COULDNT_READ_FILE,
    CURLE_LDAP_CANNOT_BIND, CURLE_LDAP_SEARCH_FAILED, CURLE_OBSOLETE40, CURLE_FUNCTION_NOT_FOUND, CURLE_ABORTED_BY_CALLBACK,
    CURLE_BAD_FUNCTION_ARGUMENT, CURLE_OBSOLETE44, CURLE_INTERFACE_FAILED, CURLE_OBSOLETE46, CURLE_TOO_MANY_REDIRECTS,
    CURLE_UNKNOWN_OPTION, CURLE_TELNET_OPTION_SYNTAX, CURLE_OBSOLETE50, CURLE_PEER_FAILED_VERIFICATION, CURLE_GOT_NOTHING,
    CURLE_SSL_ENGINE_NOTFOUND, CURLE_SSL_ENGINE_SETFAILED, CURLE_SEND_ERROR, CURLE_RECV_ERROR, CURLE_OBSOLETE57,
    CURLE_SSL_CERTPROBLEM, CURLE_SSL_CIPHER, CURLE_SSL_CACERT, CURLE_BAD_CONTENT_ENCODING, CURLE_LDAP_INVALID_URL,
    CURLE_FILESIZE_EXCEEDED, CURLE_USE_SSL_FAILED, CURLE_SEND_FAIL_REWIND, CURLE_SSL_ENGINE_INITFAILED, CURLE_LOGIN_DENIED,
    CURLE_TFTP_NOTFOUND, CURLE_TFTP_PERM, CURLE_REMOTE_DISK_FULL, CURLE_TFTP_ILLEGAL, CURLE_TFTP_UNKNOWNID,
    CURLE_REMOTE_FILE_EXISTS, CURLE_TFTP_NOSUCHUSER, CURLE_CONV_FAILED, CURLE_CONV_REQD, CURLE_SSL_CACERT_BADFILE,
    CURLE_REMOTE_FILE_NOT_FOUND, CURLE_SSH, CURLE_SSL_SHUTDOWN_FAILED, CURLE_AGAIN, CURLE_SSL_CRL_BADFILE, CURLE_SSL_ISSUER_ERROR,
    CURLE_FTP_PRET_FAILED, CURLE_RTSP_CSEQ_ERROR, CURLE_RTSP_SESSION_ERROR, CURLE_FTP_BAD_FILE_LIST, CURLE_CHUNK_FAILED,
    CURLE_NO_CONNECTION_AVAILABLE, CURLE_SSL_PINNEDPUBKEYNOTMATCH, CURLE_SSL_INVALIDCERTSTATUS, CURL_LAST
  );

  const
    CURLINFO_STRING = $100000;
    CURLINFO_LONG = $200000;
    CURLINFO_DOUBLE = $300000;
    CURLINFO_SLIST = $400000;
    CURLINFO_SOCKET = $500000;
    CURLINFO_MASK = $0fffff;
    CURLINFO_TYPEMASK = $f00000;

    CURL_GLOBAL_SSL = 1 shl 0;
    CURL_GLOBAL_WIN32 = 1 shl 1;
    CURL_GLOBAL_ALL = CURL_GLOBAL_SSL or CURL_GLOBAL_WIN32;
    CURL_GLOBAL_NOTHING = 0;
    CURL_GLOBAL_DEFAULT = CURL_GLOBAL_ALL;
    CURL_GLOBAL_ACK_EINTR = 1 shl 2;

  type

  CURLINFO = public enum (
    CURLINFO_NONE, CURLINFO_EFFECTIVE_URL = CURLINFO_STRING + 1, CURLINFO_RESPONSE_CODE = CURLINFO_LONG + 2,
    CURLINFO_TOTAL_TIME = CURLINFO_DOUBLE + 3, CURLINFO_NAMELOOKUP_TIME = CURLINFO_DOUBLE + 4,
    CURLINFO_CONNECT_TIME = CURLINFO_DOUBLE + 5, CURLINFO_PRETRANSFER_TIME = CURLINFO_DOUBLE + 6,
    CURLINFO_SIZE_UPLOAD = CURLINFO_DOUBLE + 7, CURLINFO_SIZE_DOWNLOAD = CURLINFO_DOUBLE + 8,
    CURLINFO_SPEED_DOWNLOAD = CURLINFO_DOUBLE + 9, CURLINFO_SPEED_UPLOAD = CURLINFO_DOUBLE + 10,
    CURLINFO_HEADER_SIZE = CURLINFO_LONG + 11, CURLINFO_REQUEST_SIZE = CURLINFO_LONG + 12,
    CURLINFO_SSL_VERIFYRESULT = CURLINFO_LONG + 13, CURLINFO_FILETIME = CURLINFO_LONG + 14,
    CURLINFO_CONTENT_LENGTH_DOWNLOAD = CURLINFO_DOUBLE + 15, CURLINFO_CONTENT_LENGTH_UPLOAD = CURLINFO_DOUBLE + 16,
    CURLINFO_STARTTRANSFER_TIME = CURLINFO_DOUBLE + 17, CURLINFO_CONTENT_TYPE = CURLINFO_STRING + 18,
    CURLINFO_REDIRECT_TIME = CURLINFO_DOUBLE + 19, CURLINFO_REDIRECT_COUNT = CURLINFO_LONG + 20,
    CURLINFO_PRIVATE = CURLINFO_STRING + 21, CURLINFO_HTTP_CONNECTCODE = CURLINFO_LONG + 22,
    CURLINFO_HTTPAUTH_AVAIL = CURLINFO_LONG + 23, CURLINFO_PROXYAUTH_AVAIL = CURLINFO_LONG + 24,
    CURLINFO_OS_ERRNO = CURLINFO_LONG + 25, CURLINFO_NUM_CONNECTS = CURLINFO_LONG + 26,
    CURLINFO_SSL_ENGINES = CURLINFO_SLIST + 27, CURLINFO_COOKIELIST = CURLINFO_SLIST + 28,
    CURLINFO_LASTSOCKET = CURLINFO_LONG + 29, CURLINFO_FTP_ENTRY_PATH = CURLINFO_STRING + 30,
    CURLINFO_REDIRECT_URL = CURLINFO_STRING + 31, CURLINFO_PRIMARY_IP = CURLINFO_STRING + 32,
    CURLINFO_APPCONNECT_TIME = CURLINFO_DOUBLE + 33, CURLINFO_CERTINFO = CURLINFO_SLIST + 34,
    CURLINFO_CONDITION_UNMET = CURLINFO_LONG + 35, CURLINFO_RTSP_SESSION_ID = CURLINFO_STRING + 36,
    CURLINFO_RTSP_CLIENT_CSEQ = CURLINFO_LONG + 37, CURLINFO_RTSP_SERVER_CSEQ = CURLINFO_LONG + 38,
    CURLINFO_RTSP_CSEQ_RECV = CURLINFO_LONG + 39, CURLINFO_PRIMARY_PORT = CURLINFO_LONG + 40,
    CURLINFO_LOCAL_IP = CURLINFO_STRING + 41, CURLINFO_LOCAL_PORT = CURLINFO_LONG + 42,
    CURLINFO_TLS_SESSION = CURLINFO_SLIST + 43, CURLINFO_ACTIVESOCKET = CURLINFO_SOCKET + 44,
    CURLINFO_LASTONE = 44
  );

  CURLOption = public enum (
    CURLOPT_PORT = 3, CURLOPT_TIMEOUT = 13, CURLOPT_INFILESIZE = 14, CURLOPT_LOW_SPEED_LIMIT = 19, CURLOPT_LOW_SPEED_TIME = 20,
    CURLOPT_RESUME_FROM = 21, CURLOPT_CRLF = 27, CURLOPT_SSLVERSION = 32, CURLOPT_TIMECONDITION = 33, CURLOPT_TIMEVALUE = 34,
    CURLOPT_VERBOSE = 41, CURLOPT_HEADER = 42, CURLOPT_NOPROGRESS = 43, CURLOPT_NOBODY = 44, CURLOPT_FAILONERROR = 45,
    CURLOPT_UPLOAD = 46, CURLOPT_POST = 47, CURLOPT_DIRLISTONLY = 48, CURLOPT_APPEND = 50, CURLOPT_NETRC = 51,
    CURLOPT_FOLLOWLOCATION = 52, CURLOPT_TRANSFERTEXT = 53, CURLOPT_PUT = 54, CURLOPT_AUTOREFERER = 58, CURLOPT_PROXYPORT = 59,
    CURLOPT_POSTFIELDSIZE = 60, CURLOPT_HTTPPROXYTUNNEL = 61, CURLOPT_SSL_VERIFYPEER = 64, CURLOPT_MAXREDIRS = 68,
    CURLOPT_FILETIME = 69, CURLOPT_MAXCONNECTS = 71, CURLOPT_CLOSEPOLICY = 72, CURLOPT_FRESH_CONNECT = 74, CURLOPT_FORBID_REUSE = 75,
    CURLOPT_CONNECTTIMEOUT = 78, CURLOPT_HTTPGET = 80, CURLOPT_SSL_VERIFYHOST = 81, CURLOPT_HTTP_VERSION = 84, CURLOPT_FTP_USE_EPSV = 85,
    CURLOPT_SSLENGINE_DEFAULT = 90, CURLOPT_DNS_USE_GLOBAL_CACHE = 91, CURLOPT_DNS_CACHE_TIMEOUT = 92, CURLOPT_COOKIESESSION = 96,
    CURLOPT_BUFFERSIZE = 98, CURLOPT_NOSIGNAL = 99,

    CURLOPT_PROXYTYPE = 101, CURLOPT_UNRESTRICTED_AUTH = 105, CURLOPT_FTP_USE_EPRT = 106,
    CURLOPT_HTTPAUTH = 107, CURLOPT_FTP_CREATE_MISSING_DIRS = 110, CURLOPT_PROXYAUTH = 111, CURLOPT_FTP_RESPONSE_TIMEOUT = 112,
    CURLOPT_SERVER_RESPONSE_TIMEOUT = CURLOPT_FTP_RESPONSE_TIMEOUT, CURLOPT_IPRESOLVE = 113, CURLOPT_MAXFILESIZE = 114,
    CURLOPT_USE_SSL = 119, CURLOPT_TCP_NODELAY = 121, CURLOPT_FTPSSLAUTH = 129, CURLOPT_IGNORE_CONTENT_LENGTH = 136,
    CURLOPT_FTP_SKIP_PASV_IP = 137, CURLOPT_FTP_FILEMETHOD = 138, CURLOPT_LOCALPORT = 139, CURLOPT_LOCALPORTRANGE = 140,
    CURLOPT_CONNECTONLY = 141, CURLOPT_SSL_SESSIONID_CACHE = 150, CURLOPT_SSH_AUTH_TYPES = 151, CURLOPT_FTP_SSL_CCC = 154,
    CURLOPT_TIMEOUT_MS = 155, CURLOPT_CONNECTTIMEOUT_MS = 156, CURLOPT_HTTP_TRANSFER_DECODING = 157, CURLOPT_HTTP_CONTENT_DECODING = 158,
    CURLOPT_NEW_FILE_PERMS = 159, CURLOPT_NEW_DIRECTORY_PERMS = 160, CURLOPT_POSTREDIR = 161, CURLOPT_PROXY_TRANSFER_MODE = 166,
    CURLOPT_ADDRESS_SCOPE = 171, CURLOPT_CERTINFO = 172, CURLOPT_TFTP_BLKSIZE = 178, CURLOPT_SOCKS5_GSSAPI_NEC = 180, CURLOPT_PROTOCOLS = 181,
    CURLOPT_REDIR_PROTOCOLS = 182, CURLOPT_FTP_USE_PRET = 188, CURLOPT_RTSP_REQUEST = 189, CURLOPT_RTSP_CLIENT_CSEQ = 193,
    CURLOPT_RTSP_SERVER_CSEQ = 194, CURLOPT_WILDCARDMATCH = 197,

    CURLOPT_TRANSFER_ENCODING = 207, CURLOPT_GSSAPI_DELEGATION = 210,
    CURLOPT_ACCEPTTIMEOUT_MS = 212, CURLOPT_TCP_KEEPALIVE = 213, CURLOPT_TCP_KEEPIDLE = 214, CURLOPT_TCP_KEEPINTVL = 215,
    CURLOPT_SSL_OPTIONS = 216, CURLOPT_SASL_IR = 218, CURLOPT_SSL_ENABLE_NPN = 225, CURLOPT_SSL_ENABLE_ALPN = 226,
    CURLOPT_EXPECT_100_TIMEOUT_MS = 227, CURLOPT_HEADEROPT = 229, CURLOPT_SSL_VERIFYSTATUS = 232, CURLOPT_SSL_FALSESTART = 233,
    CURLOPT_PATH_AS_IS = 234,
    CURLOPT_PIPEWAIT = 237, CURLOPT_STREAM_WEIGHT = 239,

    CURLOPT_WRITEDATA = 10001, CURLOPT_URL = 10002, CURLOPT_PROXY = 10004, CURLOPT_USERPWD = 10005, CURLOPT_PROXYUSERPWD = 10006,
    CURLOPT_RANGE = 10007, CURLOPT_READDATA = 10009, CURLOPT_ERRORBUFFER = 10010, CURLOPT_POSTFIELDS = 10015, CURLOPT_REFERER = 10016,
    CURLOPT_FTPPORT = 10017, CURLOPT_USERAGENT = 10018, CURLOPT_COOKIE = 10022, CURLOPT_HTTPHEADER = 10023, CURLOPT_HTTPPOST = 10024,
    CURLOPT_SSLCERT = 10025, CURLOPT_KEYPASSWD = 10026, CURLOPT_QUOTE = 10028, CURLOPT_HEADERDATA = 10029, CURLOPT_COOKIEFILE = 10031,
    CURLOPT_CUSTOMREQUEST = 10036, CURLOPT_STDERR = 10037, CURLOPT_POSTQUOTE = 10039, CURLOPT_OBSOLETE = 10040, CURLOPT_PROGRESSDATA = 10057,
    CURLOPT_INTERFACE = 10062, CURLOPT_KRBLEVEL = 10063, CURLOPT_CAINFO = 10065, CURLOPT_TELNETOPTIONS = 10070, CURLOPT_RANDOM_FILE = 10076,
    CURLOPT_EGDSOCKET = 10077, CURLOPT_COOKIEJAR = 10082, CURLOPT_SSL_CIPHER_LIST = 10083, CURLOPT_SSLCERTTYPE = 10086, CURLOPT_SSLKEY = 10087,
    CURLOPT_SSLKEYTYPE = 10088, CURLOPT_SSLENGINE = 10089, CURLOPT_PREQUOTE = 10093, CURLOPT_DEBUGDATA = 10095, CURLOPT_CAPATH = 10097,

    CURLOPT_SHARE = 10100, CURLOPT_ENCODING = 10102, CURLOPT_PRIVATE = 10103, CURLOPT_HTTP200ALIASES = 10104, CURLOPT_SSL_CTX_DATA = 10109,
    CURLOPT_NETRC_FILE = 10118, CURLOPT_SOURCE_USERPWD = 10123, CURLOPT_SOURCE_PREQUOTE = 10127, CURLOPT_SOURCE_POSTQUOTE = 10128,
    CURLOPT_IOCTLDATA = 10131, CURLOPT_SOURCE_URL = 10132, CURLOPT_SOURCE_QUOTE = 10133, CURLOPT_FTP_ACCOUNT = 10134, CURLOPT_COOKIELIST = 10135,
    CURLOPT_FTP_ALTERNATIVE_TO_USER = 10147, CURLOPT_SOCKOPTDATA = 10149, CURLOPT_SSH_PUBLIC_KEYFILE = 10152, CURLOPT_SSH_PRIVATE_KEYFILE = 10153,
    CURLOPT_SSH_HOST_PUBLIC_KEY_MD5 = 10162, CURLOPT_OPENSOCKETDATA = 10164, CURLOPT_COPYPOSTFIELDS = 10165, CURLOPT_SEEKDATA = 10168,
    CURLOPT_CRLFILE = 10169, CURLOPT_ISSUERCERT = 10170, CURLOPT_USERNAME = 10173, CURLOPT_PASSWORD = 10174, CURLOPT_PROXYUSERNAME = 10175,
    CURLOPT_PROXYPASSWORD = 10176, CURLOPT_NOPROXY = 10177, CURLOPT_SOCKS5_GSSAPI_SERVICE = 10179, CURLOPT_SSH_KNOWNHOSTS = 10183,
    CURLOPT_SSH_KEYDATA = 10185, CURLOPT_MAIL_FROM = 10186, CURLOPT_MAIL_RCPT = 10187, CURLOPT_RTSP_SESSION_ID = 10190,
    CURLOPT_RTSP_STREAM_URI = 10191, CURLOPT_RTSP_TRANSPORT = 10192, CURLOPT_INTERLEAVEDATA = 10195,

    CURLOPT_CHUNK_DATA = 10201, CURLOPT_FNMATCH_DATA = 10202, CURLOPT_RESOLVE = 10203, CURLOPT_TLSAUTH_USERNAME = 10204,
    CURLOPT_TLSAUTH_PASSWORD = 10205, CURLOPT_TLSAUTH_TYPE = 10206, CURLOPT_CLOSESOCKETDATA = 10209, CURLOPT_DNS_SERVERS = 10211,
    CURLOPT_MAIL_AUTH = 10217, CURLOPT_XOAUTH2_BEARER = 10220, CURLOPT_DNS_INTERFACE = 10221, CURLOPT_DNS_LOCAL_IP4 = 10222,
    CURLOPT_DNS_LOCAL_IP6 = 10223, CURLOPT_LOGIN_OPTIONS = 10224, CURLOPT_PROXYHEADER = 10228, CURLOPT_PINNEDPUBLICKEY = 10230,
    CURLOPT_UNIX_SOCKET_PATH = 10231, CURLOPT_PROXY_SERVICE_NAME = 10235, CURLOPT_SERVICE_NAME = 10236, CURLOPT_DEFAULT_PROTOCOL = 10238,
    CURLOPT_STREAM_DEPENDS = 10240, CURLOPT_STREAM_DEPENDS_E = 10241,

    CURLOPT_WRITEFUNCTION = 20011, CURLOPT_READFUNCTION = 20012, CURLOPT_PROGRESSFUNCTION = 20056, CURLOPT_HEADERFUNCTION = 20079,
    CURLOPT_DEBUGFUNCTION = 20094, CURLOPT_SSL_CTX_FUNCTION = 20108, CURLOPT_IOCTLFUNCTION = 20130, CURLOPT_CONV_FROM_NETWORK_FUNCTION = 20142,
    CURLOPT_CONV_TO_NETWORK_FUNCTION = 20143, CURLOPT_CONV_FROM_UTF8_FUNCTION = 20144, CURLOPT_SOCKOPTFUNCTION = 20148,
    CURLOPT_OPENSOCKETFUNCTION = 20163, CURLOPT_SEEKFUNCTION = 20167, CURLOPT_SSH_KEYFUNCTION = 20184, CURLOPT_INTERLEAVEFUNCTION = 20196,
    CURLOPT_CHUNK_BGN_FUNCTION = 20198, CURLOPT_CHUNK_END_FUNCTION = 20199, CURLOPT_FNMATCH_FUNCTION = 20200, CURLOPT_CLOSESOCKETFUNCTION = 20208,
    CURLOPT_XFERINFOFUNCTION = 20219,

    CURLOPT_INFILESIZE_LARGE = 30115, CURLOPT_RESUME_FROM_LARGE = 30116, CURLOPT_MAXFILESIZE_LARGE = 30117, CURLOPT_POSTFIELDSIZE_LARGE = 30120,
    CURLOPT_MAX_SEND_SPEED_LARGE = 30145, CURLOPT_MAX_RECV_SPEED_LARGE = 30146, CURLOPT_LASTENTRY
  );

  curl_slist = public record
  public
    data: ^AnsiChar;
    next: ^curl_slist;
  end;

  PCURL = ^void;
  CurlGlobalInitFunc = public function(flags: Integer): CURLCode;
  CurlGlobalCleanupFunc = public procedure;
  CurlEasyPerform = public function(curl: PCURL): CURLCode;
  CurlEasyGetInfo1Func = public function(curl: PCURL; info: CURLINFO; data: ^NativeInt): CURLCode;
  CurlEasySetOptPointerFunc = public function(curl: PCURL; option: CURLOption; aData: ^void): CURLCode;
  CurlEasySetOptIntegerFunc = public function(curl: PCURL; option: CURLOption; aData: Integer): CURLCode;
  CurlEasyInitFunc = public function: PCURL;
  CurlEasyCleanUp = public procedure(curl: PCURL);
  CurlSListAppendFunc = public function(list: ^curl_slist; str: ^AnsiChar): ^curl_slist;
  CurlSListFreeAllFunc = public procedure(list: ^curl_slist);

  CurlHelper = public class
  private
    class const LibCurl: RemObjects.Elements.System.String = 'libcurl.so';
    class var fLib: ^Void;
    class method GetSymbol(SymbolName: String): ^Void; inline;
    class constructor;
    finalizer;
  public
    class var GlobalInit: CurlGlobalInitFunc;
    class var GlobalCleanup: CurlGlobalCleanupFunc;
    class var EasyPerform: CurlEasyPerform;
    class var EasyGetInfo1: CurlEasyGetInfo1Func;
    class var EasySetOptPointer: CurlEasySetOptPointerFunc;
    class var EasySetOptInteger: CurlEasySetOptIntegerFunc;
    class var EasyInit: CurlEasyInitFunc;
    class var EasyCleanUp: CurlEasyCleanUp;
    class var SListAppend: CurlSListAppendFunc;
    class var SListFreeAll: CurlSListFreeAllFunc;
    class method ReceiveData(Buffer: ^void; aSize: rtl.size_t; Nmemb: rtl.size_t; UserData: ^void): rtl.size_t;
    class method ReceiveHeaders(Buffer: ^void; aSize: rtl.size_t; Nitems: rtl.size_t; UserData: ^void): rtl.size_t;
    class method SendData(Buffer: ^void; aSize: rtl.size_t; Nmemb: rtl.size_t; UserData: ^void): rtl.size_t;
  end;

  CurlUploadHelper = class assembly
  public
     Data: array of Byte;
     TotalData: Integer;
     constructor(aData: array of Byte);
  end;

implementation

class method CurlHelper.GetSymbol(SymbolName: String): ^Void;
begin
  result := rtl.dlsym(fLib, @RemObjects.Elements.System.String(SymbolName).ToAnsiChars(true)[0]);
end;

class constructor CurlHelper;
begin
  fLib := rtl.dlopen(@LibCurl.ToAnsiChars(true)[0], rtl.RTLD_LAZY);
  if fLib = nil then
    raise new CurlException('libcurl.so is missing');
  GlobalInit := CurlGlobalInitFunc(GetSymbol('curl_global_init'));
  GlobalCleanup := CurlGlobalCleanupFunc(GetSymbol('curl_global_cleanup'));
  EasyPerform := CurlEasyPerform(GetSymbol('curl_easy_perform'));
  EasyGetInfo1 := CurlEasyGetInfo1Func(GetSymbol('curl_easy_getinfo'));
  EasySetOptPointer := CurlEasySetOptPointerFunc(GetSymbol('curl_easy_setopt'));
  EasySetOptInteger := CurlEasySetOptIntegerFunc(EasySetOptPointer);
  EasyInit := CurlEasyInitFunc(GetSymbol('curl_easy_init'));
  EasyCleanUp := CurlEasyCleanUp(GetSymbol('curl_easy_cleanup'));
  SListAppend := CurlSListAppendFunc(GetSymbol('curl_slist_append'));
  SListFreeAll := CurlSListFreeAllFunc(GetSymbol('curl_slist_free_all'));

  GlobalInit(CURL_GLOBAL_DEFAULT);
end;

finalizer CurlHelper;
begin
  GlobalCleanup;
  rtl.dlclose(fLib);
end;

class method CurlHelper.ReceiveData(Buffer: ^void; aSize: rtl.size_t; Nmemb: rtl.size_t; UserData: ^void): rtl.size_t;
begin
  if UserData <> nil then begin
    var lStream := InternalCalls.Cast<MemoryStream>(UserData);
    var lTotal := aSize * Nmemb;
    var lBytes := new Byte[lTotal];
    rtl.memcpy(@lBytes[0], Buffer, lTotal);
    lStream.Write(lBytes, lTotal);
    result := lTotal;
  end
  else
    result := 0;
end;

class method CurlHelper.ReceiveHeaders(Buffer: ^void; aSize: rtl.size_t; Nitems: rtl.size_t; UserData: ^void): rtl.size_t;
begin
  if UserData <> nil then begin
    var lHeaders := InternalCalls.Cast<Dictionary<String, String>>(UserData);
    var lTotal := aSize * Nitems;
    var lBytes := new Byte[lTotal];
    rtl.memcpy(@lBytes[0], Buffer, lTotal);
    var lString := Encoding.UTF8.GetString(lBytes);
    var lPos := lString.IndexOf(':');
    if lPos > 0 then begin
      var lKey := lString.Substring(0, lPos).Trim;
      var lValue := lString.Substring(lPos + 1).Trim;
      lHeaders.Add(lKey, lValue);
    end;
    result := lTotal;
  end
  else
    result := 0;
end;
class method CurlHelper.SendData(Buffer: ^void; aSize: rtl.size_t; Nmemb: rtl.size_t; UserData: ^void): rtl.size_t;
begin
  result := 0;
  if UserData <> nil then begin
    var lHelper := InternalCalls.Cast<CurlUploadHelper>(UserData);
    if lHelper.TotalData < length(lHelper.Data) then begin
      result := aSize * Nmemb;
      rtl.memcpy(Buffer, @lHelper.Data[lHelper.TotalData], result);
      inc(lHelper.TotalData, result);
    end;
  end;
end;

constructor CurlUploadHelper(aData: array of Byte);
begin
  Data := aData;
end;

{$ENDIF}

end.