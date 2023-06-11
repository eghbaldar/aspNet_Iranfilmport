<%@ Page Title="" Language="VB" MasterPageFile="~/Master_Main.master" AutoEventWireup="false" CodeFile="contract.aspx.vb" Inherits="contract" %>


<%@ Register Src="usercontrols/RightSide.ascx" TagName="RightSide" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!--Page Title-->
    <section class="page-title text-center" style="background-image: url(files/images/background/banner_8.jpg);">
        <div class="container">
            <div class="title-text">
                <h1>
                    <span style="font-family: Titr;">جزییات قرارداد</span>
                </h1>
            </div>
        </div>
    </section>
    <!--End Page Title-->
    <section class="blog-section style-four section2" style="margin-top: -50px;">

        <div class="container">
            <div class="row">
               <div class="col-md-9 col-sm-12 col-xs-12">
                    <div style="width:100%;direction:rtl;text-align:right;font-family:Samim;">
                        <div style="text-align:center;">
                            <asp:Image ID="Image1" Width="100px" runat="server" ImageUrl="~/files/images/icons/contracticon.png"></asp:Image>
                        </div>
                       <div style="margin:5px;">
                            <div id="NOK" class="alert alert-danger" role="alert" visible="false"   runat="server">
                        <asp:Label ID="lblwarning" runat="server" ></asp:Label>
                             <br />
                            جهت کسب اطلاعات بیشتر با واحد مالی و قراردادهای شرکت در تماس باشید.
                            <br />
                            <a href="../contactus/">تماس با ما</a>
                        </div>
                        <div id="OK" class="alert alert-success" role="alert" visible="false"  runat="server">
                            قرارداد با مشخصات زیر در سیستم ثبت شده است:
                            <br />
                            تاریخ ثبت:
                        <strong>
                            <asp:Label ID="lblTempContractInformation_regDate" runat="server" ></asp:Label>    
                        </strong>
                            <br />
                            وضیعت قرارداد:
                            <strong>
                            <asp:Label ID="lblTempContractInformation_status" runat="server" ></asp:Label>    
                                </strong>
                            <br />
                            شماره قرارداد:
                                <strong>
                            <asp:Label ID="lblTempContractInformation_contractNumber" runat="server" ></asp:Label>    
                                    </strong>
</div>
                       </div>
                    
                    </div>
               </div>                
<uc1:RightSide ID="RightSide1" runat="server" />
            </div>
        </div>
    </section>

</asp:Content>

