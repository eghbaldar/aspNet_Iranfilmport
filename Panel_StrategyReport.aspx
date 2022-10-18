<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPanel.master" AutoEventWireup="false" CodeFile="Panel_StrategyReport.aspx.vb" Inherits="Panel_StrategyReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

    <script type="text/javascript">


        // Load google charts
        google.charts.load('current', { 'packages': ['corechart'] });
        google.charts.setOnLoadCallback(drawChart);

        // Draw the chart and set the chart values

        function drawChart() {

            var Aplus = document.getElementById('HF_Aplus').value
            var A = document.getElementById('HF_A').value
            var B = document.getElementById('HF_B').value
            var C = document.getElementById('HF_C').value
            var D = document.getElementById('HF_D').value

            var data = google.visualization.arrayToDataTable([
                ['Task', 'Hours per Day'],
                ['A+', parseInt(Aplus)],
                ['A', parseInt(A)],
                ['B', parseInt(B)],
                ['C', parseInt(C)],
                ['D', parseInt(D)]
            ]);

            // Optional; add a title and set the width and height of the chart
            var options = { 'title': '', 'width': 350, 'height': 400, is3D: true };

            // Display the chart inside the <div> element with id="piechart"
            var chart = new google.visualization.PieChart(document.getElementById('piechart'));
            chart.draw(data, options);
        }
    </script>

    <style>
        #chart_wrap {
            position: relative;
            padding-bottom: 100%;
            height: 0;
            overflow: hidden;
        }

        #chart_div {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="TitleTitle">
        مدل و استراتژی پخش
    </div>
    <div style="padding: 15px;">
        <asp:Label ID="lblStrategyText" runat="server" Text="Lab1el"></asp:Label>
        <br />
        <asp:Label ID="lblMethod" runat="server" Text="Labe2l"></asp:Label>
    </div>
    <div class="TitleTitle">
        پخش به تفکیک آماری
    </div>

    <asp:HiddenField ClientIDMode="Static" ID="HF_Aplus" runat="server" />
    <asp:HiddenField ClientIDMode="Static" ID="HF_A" runat="server" />
    <asp:HiddenField ClientIDMode="Static" ID="HF_B" runat="server" />
    <asp:HiddenField ClientIDMode="Static" ID="HF_C" runat="server" />
    <asp:HiddenField ClientIDMode="Static" ID="HF_D" runat="server" />
    <div style="direction: ltr; text-align: left; padding: 30px;">
        <asp:Label ID="lblStrategy" runat="server" Text="La3bel"></asp:Label>
    </div>
    <div id="chart_wrap" style="padding-top: 10px;">

        <div id="piechart" style="width: 100px;"></div>


    </div>
</asp:Content>

