<%@ Control Language="VB" AutoEventWireup="false" CodeFile="KingRelatedPost.ascx.vb" Inherits="usercontrols_KingRelatedPost" %>
<asp:HiddenField ID="HiddenFieldPostId" runat="server" />

<div class="related-posts">
    <h3 class="mb-30">پست های مرتبط</h3>
    <div class="row">
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SDS">
            <ItemTemplate>
                <article class="col-lg-4">
            <div class="background-white border-radius-10 p-10 mb-30">
                <div class="post-thumb d-flex mb-15 border-radius-15 img-hover-scale">
                    <a target="_blank" href='<%# Eval("id", "/{0}") %>'>
                         <asp:Image AlternateText='<%# Eval("title").Replace("ي", "ی") %>' Style="width: 100%; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-radius: 5px;"
                        ID="Image1"
                        runat="server" ImageUrl='<%# String.Format("~/files/uploadFiles/article/{0}", Eval("photo")) %>' />
                    </a>
                &nbsp;</div>
                <div class="pl-10 pr-10">
                    <h5 class="post-title mb-15">
                        <span class="post-format-icon">
                            <ion-icon name="image-outline" role="img" class="md hydrated" aria-label="image outline"></ion-icon>
                        </span>
                        <a target="_blank" href='<%# Eval("id", "/{0}") %>'><%# Eval("Title") %> </a></h5>
                    <div class="entry-meta meta-1 font-x-small color-grey float-right text-uppercase mb-10">
                        <span class="post-by">توسط <a href="author.html">الناز روستایی</a></span>
                        <span class="post-on">8 دقیقه پیش</span>
                    </div>
                </div>
            </div>
        </article>
            </ItemTemplate>
        </asp:Repeater>
            <asp:SqlDataSource ID="SDS" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
        SelectCommand="SELECT top 3 * FROM [tbl_articles] WHERE [CateCode] in (SELECT [CateCode] from [tbl_articles] where [Id] = @ID) order by date_time desc">
        <SelectParameters>
            <asp:ControlParameter ControlID="HiddenFieldPostId" Name="ID" PropertyName="Value" />
        </SelectParameters>
    </asp:SqlDataSource>
    </div>
</div>
