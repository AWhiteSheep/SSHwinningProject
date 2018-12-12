﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Acceuil.Master" AutoEventWireup="true" CodeBehind="Album.aspx.cs" Inherits="Inscription.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Content/Album.css" rel="stylesheet" />
    <title>Album</title>
    <style>
        .choix-filter-annee {
            margin-bottom: 12px;
            font-weight: 500;
            border-width: 2px;
            font-style: normal;
            letter-spacing: 1px;
            margin: .4rem .8rem;
            white-space: normal;
            -webkit-transition: all 0.3s ease-in-out;
            -moz-transition: all 0.3s ease-in-out;
            transition: all 0.3s ease-in-out;
            padding: 1rem 3rem;
            border-radius: 3px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            word-break: break-word;
        }
        /*#all {
            background-image: url('../Images/Banners/GreenBubble.png');
            background-repeat: no-repeat;
            background-size: contain;
            background-color: rgba(52, 113, 150, 0);
            height: 62px;
            width: 133px;
            background-position-y: bottom;
        }
        #all2017{
            background-image: url('../Images/Banners/YellowBubble.png');
            background-repeat: no-repeat;
            background-size: contain;
            background-color: rgba(52, 113, 150, 0);
            height: 62px;
            width: 133px;
            background-position-y: bottom;
        }
        #all2018{
            background-image: url('../Images/Banners/BlueBubble.png');
            background-repeat: no-repeat;
            background-size: contain;
            background-color: rgba(52, 113, 150, 0);
            height: 62px;
            width: 133px;
            background-position-y: bottom;
        }*/
        .no_display{
            width:0% ;
            transition: width 0.5s linear;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SQLconnection" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <div style="">
    <div class="row container align-content-center" style="margin:auto;padding:10px 0px">

    <div class="menuYear" style="margin:auto; padding:24px 0">
        <button class="btn choix-filter-annee" id="all">Toutes</button>
        <button class="btn choix-filter-annee" id="all2017">2017</button>
        <button class="btn choix-filter-annee" id="all2018">2018</button>
        <script>
            $(".btn").click(function () {
                $(this).toggleClass("active");
                $(".btn").not(this).removeClass("active");
            });
            $("#all").click(function () {
                $("div").filter(".all").removeClass("no_display");
                //$("div").filter(".all").css("display", "");
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
        <br />
        <hr style="width: 100%; border: .5px solid black; margin: auto; visibility: hidden" />
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
    </div>
</asp:Content>
