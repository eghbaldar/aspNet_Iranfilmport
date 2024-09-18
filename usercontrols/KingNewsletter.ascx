<%@ Control Language="VB" AutoEventWireup="false" CodeFile="KingNewsletter.ascx.vb" Inherits="usercontrols_KingNewsletter" %>
<div class="sidebar-widget widget_newsletter border-radius-10 p-20 kingYellowBackColor mb-30">
    <div class="widget-header widget-header-style-1 position-relative mb-15">
        <h5 class="widget-title">خبرنامه</h5>
    </div>
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <div class="newsletter" id="newsletter_1"  runat="server" >
                <p class="font-medium">از مهمترین اخبار و رویدادهای سینمایی و مدیوم فیلم کوتاه مطلع شوید:</p>
                <div runat="server" >
                    <div class="form-newsletter position-relative">
                        <asp:TextBox Style="text-align: center;" placeholder="ایمیل خود را اینجا وارد کنید"
                            ID="txtNewsletterEmail" runat="server"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Button ID="btnNewsletter" runat="server" Text="عضوم کن!"
                            Style="cursor: pointer; background-color: #1D8BA9; color: white;" />
                    </div>
                </div>
            </div>
            <div class="newsletter" id="newsletter_2" runat="server" visible="false">
                <asp:Label ID="lbl" runat="server" Text="Label"></asp:Label>
            </div>
            <div style="text-align:center;" id="DivlblError" runat="server" Visible="false">
                <br />
                <asp:Label ID="lblError" runat="server"></asp:Label>
                <br />
            </div>
            <asp:UpdateProgress ID="UpdateProgress" runat="server">
                <ProgressTemplate>
                    در حال ثبت ...
                </ProgressTemplate>
            </asp:UpdateProgress>
        </ContentTemplate>
    </asp:UpdatePanel>
</div>
