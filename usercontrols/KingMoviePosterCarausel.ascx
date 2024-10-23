<%@ Control Language="VB" AutoEventWireup="false" CodeFile="KingMoviePosterCarausel.ascx.vb" Inherits="usercontrols_KingMoviePosterCarausel" %>
<div class="post-carausel-1-items mb-50">

    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SDS_profilesubdomain">
        <ItemTemplate>


            <div class="col">
                <div class="slider-single bg-white p-10 border-radius-15">

                    <div class="post-thumb position-relative pointer">


                        <div class="img-hover-scale border-radius-10">
                            <span class="top-right-icon bg-dark"><i class="mdi mdi-flash-on"></i></span>
                            <a onclick="OpenPosterDetail('<%# Eval("nameEn") %>',
                                '<%# Eval("nameFa") %>',
                                '<%# IIF(Eval("type") = 0 Or Eval("type") = 1, "DIRECTED BY:", "WRITTEN BY:") %>',
                                '<%# Eval("directorEn") %>',
                                '<%# IIF(Eval("type") = 0 Or Eval("type") = 1, "کارگردان:", "نویسنده:") %>',
                                '<%# Eval("directorFa") %>',
                                '<%# Eval("photo") %>');">
                                <asp:Image ID="Image2" CssClass="border-radius-10" AlternateText='<%# Eval("nameFa") %>'
                                    ImageUrl='<%# String.Format("~\convertToUnscale.aspx?photo=files\uploadFiles\PosterOfCustomers\{0}&w=452&h=640", Eval("photo")) %>'
                                    runat="server" />
                            </a>
                        </div>


                    </div>

                </div>
            </div>


        </ItemTemplate>
    </asp:Repeater>
    <asp:SqlDataSource ID="SDS_profilesubdomain" runat="server" ConnectionString="<%$ ConnectionStrings:iranfilmportConnectionString %>"
        SelectCommand="SELECT top 12 * FROM [tbl_PosterOfCustomer] order by datetime desc"></asp:SqlDataSource>

</div>
<script>
    function OpenPosterDetail(filmen, filmfa, typeen, diren, typefa, direfa, img) {

        var msg = "<img src='files/uploadFiles/PosterOfCustomers/" + img + "'/>" + "<br><br>" + 'Name: ' + filmen + '<br>' + typeen + ' ' + diren + '<br>' + 'عنوان: ' + filmfa + '<br>' + typefa + ' ' + direfa;
        Swal.fire({
            html: msg,
            confirmButtonText: "متوجه شدم",
            showCloseButton: true
        });
    }
</script>
