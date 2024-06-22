<%@ Control Language="VB" AutoEventWireup="false" CodeFile="KingTopSearch.ascx.vb" Inherits="usercontrols_KingTopSearch" %>
<div id="mySearchOverlay" class="searchOverlay">
    <span class="closebtn" onclick="closeSearch()" title="Close Overlay">x</span>
    <div class="search-overlay-content">
        <button onclick="gotosearch();" id="btnTopSearch"><i class="fa fa-search"></i></button>
        <input type="text" autofocus  id="txtTopSearch" placeholder="جستجو ..." name="search">
    </div>
</div>

<script>
    function openSearch() {
        document.getElementById("mySearchOverlay").style.display = "block";
        $('#txtTopSearch').focus();
    }
    function closeSearch() {
        document.getElementById("mySearchOverlay").style.display = "none";
    }
    function gotosearch() {
        window.open("https://www.google.com/search?q=site:http://iranfilmport.com%20" + $("#txtTopSearch").val(), "_blank");
    }
    document.getElementById('txtTopSearch').addEventListener('keypress', function (event) {
        if (event.key === 'Enter' || event.keyCode === 13) {
            gotosearch();
        }
    });
    document.addEventListener('keydown', function (event) {
        if (event.key === 'Escape' || event.keyCode === 27) {
            closeSearch();
        }
    });
    document.getElementById('mySearchOverlay').addEventListener('click', function (event) {
        if (event.target === this) {
            closeSearch();
        }
    });
</script>
