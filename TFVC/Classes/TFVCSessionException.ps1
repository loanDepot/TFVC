using namespace system

class TFVCSessionException : Exception
{
    TFVCSessionException() {}

    TFVCSessionException( [string]$Message ) : base($message) {}

    TFVCSessionException( [string]$Message,[exception]$Inner ) : base($message,$Inner) {}

}
