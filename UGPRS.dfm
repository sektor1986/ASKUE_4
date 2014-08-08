object dmGPRS: TdmGPRS
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 150
  Width = 215
  object idtcpclnt1: TIdTCPClient
    ConnectTimeout = 0
    IPVersion = Id_IPv4
    OnConnected = idtcpclnt1Connected
    Port = 0
    ReadTimeout = 7000
    Left = 28
    Top = 14
  end
end
