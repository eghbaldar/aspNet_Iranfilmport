<%@ Page Language="VB" AutoEventWireup="false" CodeFile="test.aspx.vb" Inherits="test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
        <div>
            <asp:Button ID="btnAnalyse" runat="server" Text="Analyse" />
            <br />
            <asp:ListBox Height="200px" ID="lstAnalyse" runat="server"></asp:ListBox>
        </div>
        <div>
            <asp:Button ID="Button1" runat="server" Text="Convert into Temp Folder" />
        </div>
        <div>
            <asp:Panel runat="server" ID="pnlMain">
            </asp:Panel>

        </div>
        <br />
        <div>
            <asp:Button ID="btnFireDelete" runat="server" Text="Fire!" />
            <br />
               <asp:ListBox Height="200px" ID="listFinal" runat="server"></asp:ListBox>
        </div>
        <br />
        <div>
            <asp:Button ID="btnDelete" runat="server" Text="D E L E T E" />
        </div>

                 
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
