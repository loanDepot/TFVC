Describe 'Function New-TFVCSession' {
    Context 'Functionality' {
        It 'should throw exception' {
            { New-TFVCSession -ServerURI https://localhost -ProjectCollection test } |
                Should -Throw
        }
    }
}
