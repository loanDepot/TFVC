Describe 'Function New-TFVCSession' {
    Context 'Functionality' {
        It 'should throw System.Runtime.Remoting.ServerException' {
            { New-TFVCSession -ServerURI https://localhost -ProjectCollection test } |
                Should -Throw -ExceptionType 'System.Runtime.Remoting.ServerException'
        }
    }
}
