<%@ Page Title="" Language="C#" MasterPageFile="~/Acceuil.Master" AutoEventWireup="true" CodeBehind="Album.aspx.cs" Inherits="Inscription.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Content/Album.css" rel="stylesheet" />
    <title>Album</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SQLconnection" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <div class="display-1" style="text-align:center;">Galerie</div>
    <hr style="width:70%;border: .5px solid black;"/>
    <div class="menuYear" style="text-align:center;padding-bottom:10px;">
        <button class="btn choix-filter-annee" id="all">Toutes</button>
        <button class="btn choix-filter-annee" id="all2017">2017</button>
        <button class="btn choix-filter-annee" id="all2018">2018</button>
        <script>
            $(".btn").click(function () {
                $(this).toggleClass("active");
                $(".btn").not(this).removeClass("active");
            });
            $("#all").click(function () {                
                $("div").filter(".all").css("display", "");
            });
            $("#all2017").click(function () {
                $(".all").filter(".a2017").css("display", "");
                $(".all").not(".a2017").css("display", "none");
            });
            $("#all2018").click(function () {
                $(".all").filter(".a2018").css("display", "");
                $(".all").not(".a2018").css("display", "none");
            });

        </script>
    </div>
    <div class="row container-fluid align-content-center" style="padding-left: 45px;">
        <div class="col-lg-3 col-md-4 col-sm-6 a2017 all">
            <div class="gallery_item">
                <img src="Images/Default/insta_gallery_1%20(10).jpg" />
            </div>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6 a2017 all">
            <div class="gallery_item">
                <img src="Images/Default/insta_gallery_1%20(11).jpg" />
            </div>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6 a2017 all">
            <div class="gallery_item">
                <img src="Images/Default/insta_gallery_1%20(12).jpg" />
            </div>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6 a2017 all">
            <div class="gallery_item">
                <img src="Images/Default/insta_gallery_1%20(13).jpg" />
            </div>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6 a2017 all">
            <div class="gallery_item">
                <img src="Images/Default/insta_gallery_1%20(14).jpg" />
            </div>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6 a2018 all">
            <div class="gallery_item">
                <img src="Images/Default/insta_gallery_1%20(2).jpg" />
            </div>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6 a2018 all">
            <div class="gallery_item">
                <img src="Images/Default/insta_gallery_1%20(3).jpg" />
            </div>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6 a2018 all">
            <div class="gallery_item">
                <img src="Images/Default/insta_gallery_1%20(4).jpg" />
            </div>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6 a2018 all">
            <div class="gallery_item">
                <img src="Images/Default/insta_gallery_1%20(6).jpg" />
            </div>
        </div>

        <div class="col-lg-3 col-md-4 col-sm-6 a2018 all">
            <div class="gallery_item">
                <img src="Images/Default/insta_gallery_1%20(5).jpg" />
            </div>
        </div>

        <div class="col-lg-3 col-md-4 col-sm-6 a2018 all">
            <div class="gallery_item">
                <img src="Images/Default/insta_gallery_1%20(7).jpg" />
            </div>
        </div>

        <div class="col-lg-3 col-md-4 col-sm-6 a2018 all">
            <div class="gallery_item">
                <img src="Images/Default/insta_gallery_1%20(8).jpg" />
            </div>
        </div>

        <div class="col-lg-3 col-md-4 col-sm-6 a2018 all">
            <div class="gallery_item">
                <img src="Images/Default/insta_gallery_1%20(9).jpg" />
            </div>
        </div>

        <div class="col-lg-3 col-md-4 col-sm-6 a2018 all">
            <div class="gallery_item">
                <img src="Images/Default/insta_gallery_1.jpg" />
            </div>
        </div>

    </div>

</asp:Content>
