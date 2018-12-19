<%@ Page Title="" Language="C#" MasterPageFile="~/Acceuil.Master" AutoEventWireup="true" CodeBehind="Album.aspx.cs" Inherits="Inscription.WebForm6" %>

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
        /*.no_display{
            width:0% ;
            transition: all 0.5s linear;
            display:none;
        }*/
        .all {
            display: none;
        }

        .modal-body.imageContent {
            margin: auto;
        }

        .modal-header.imageContent {
            border-bottom: none !important;
            padding: 1rem 1rem 0 1rem;
        }

        .modal-footer.imageContent {
            border-top: none !important;
        }

        .gallery_item:hover {
            cursor: pointer;
        }

            .gallery_item:hover img {
                transform: scale(1.15,1.15);
                -webkit-transform: scale(1.15,1.15);
                -moz-transform: scale(1.15,1.15);
                -ms-transform: scale(1.15,1.15);
                -o-transform: scale(1.15,1.15);
            }

            .gallery_item:hover .blur {
                background-color: rgba(0,0,0,0.65);
            }

        .gallery_item img {
            transition: all 0.25s ease-in-out;
            -webkit-transition: all 0.25s ease-in-out;
            -moz-transition: all 0.25s ease-in-out;
            -o-transition: all 0.25s ease-in-out;
            -ms-transition: all 0.25s ease-in-out;
        }

        .gallery_item .blur {
            transition: all 0.25s ease-in-out;
            -webkit-transition: all 0.25s ease-in-out;
            -moz-transition: all 0.25s ease-in-out;
            -o-transition: all 0.25s ease-in-out;
            -ms-transition: all 0.25s ease-in-out;
        }

        .gallery_item {
            position: relative;
        }

            .gallery_item .blur {
                position: absolute;
                z-index: 5;
                width: 100%;
                height: 100%;
                top: 0;
                background-color: rgba(0,0,0,0);
            }

        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SQLconnection" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <div style="min-height: 1050px">
        <div class="row container align-content-center" style="margin: auto; padding: 10px 0px;">

            <div class="menuYear" style="margin: 0 auto 0 auto; padding: 24px 0">
                <button class="btn choix-filter-annee" id="all">Toutes</button>
                <button class="btn choix-filter-annee" id="all2017">2017</button>
                <button class="btn choix-filter-annee" id="all2018">2018</button>
                <button class="btn choix-filter-annee" id="all2019">2019</button>
                <script>


                    $(".choix-filter-annee").click(function (e) {
                        $(this).toggleClass("active");
                        $(".btn").not(this).removeClass("active");
                        e.preventDefault();
                    });
                    $("#all").click(function () {
                        $("div").filter(".all").show("slow");
                        //$("div").filter(".all").css("display", "");
                    });
                    $("#all2017").click(function () {
                        $(".all").filter(".a2017").show("slow");
                        $(".all").not(".a2017").hide("slow");
                        //$(".all").filter(".a2017").css("display", "");
                        //$(".all").not(".a2017").css("display", "none");
                    });
                    $("#all2018").click(function () {
                        $(".all").filter(".a2018").show("slow");
                        $(".all").not(".a2018").hide("slow");
                        //$(".all").filter(".a2018").css("display", "");
                        //$(".all").not(".a2018").css("display", "none");
                    });
                    $("#all2019").click(function () {
                        $(".all").filter(".a2019").show("slow");
                        $(".all").not(".a2019").hide("slow");
                        //$(".all").filter(".a2018").css("display", "");
                        //$(".all").not(".a2018").css("display", "none");
                    });
                </script>
            </div>
            <br />
            <hr style="width: 100%; border: .5px solid black; margin: auto; visibility: hidden" />
            <div class="col-lg-3 col-md-4 col-sm-6 a2017 all">
                <div class="gallery_item">
                    <img class="image" src="Images/Default/insta_gallery_1%20(10).jpg" />
                    <div class="blur"></div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 a2017 all">
                <div class="gallery_item">
                    <img class="image" src="Images/Default/insta_gallery_1%20(11).jpg" />
                    <div class="blur"></div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 a2017 all">
                <div class="gallery_item">
                    <img class="image" src="Images/Default/insta_gallery_1%20(12).jpg" /><div class="blur"></div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 a2017 all">
                <div class="gallery_item">
                    <img class="image" src="Images/Default/insta_gallery_1%20(13).jpg" /><div class="blur"></div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 a2017 all">
                <div class="gallery_item">
                    <img class="image" src="Images/Default/insta_gallery_1%20(14).jpg" /><div class="blur"></div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 a2018 all">
                <div class="gallery_item">
                    <img class="image" src="Images/Default/insta_gallery_1%20(2).jpg" /><div class="blur"></div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 a2018 all">
                <div class="gallery_item">
                    <img class="image" src="Images/Default/insta_gallery_1%20(3).jpg" /><div class="blur"></div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 a2018 all">
                <div class="gallery_item">
                    <img class="image" src="Images/Default/insta_gallery_1%20(4).jpg" /><div class="blur"></div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 a2018 all">
                <div class="gallery_item">
                    <img class="image" src="Images/Default/insta_gallery_1%20(6).jpg" /><div class="blur"></div>
                </div>
            </div>

            <div class="col-lg-3 col-md-4 col-sm-6 a2018 all">
                <div class="gallery_item">
                    <img class="image" src="Images/Default/insta_gallery_1%20(5).jpg" /><div class="blur"></div>
                </div>
            </div>

            <div class="col-lg-3 col-md-4 col-sm-6 a2018 all">
                <div class="gallery_item">
                    <img class="image" src="Images/Default/insta_gallery_1%20(7).jpg" /><div class="blur"></div>
                </div>
            </div>

            <div class="col-lg-3 col-md-4 col-sm-6 a2018 all">
                <div class="gallery_item">
                    <img class="image" src="Images/Default/insta_gallery_1%20(8).jpg" /><div class="blur"></div>
                </div>
            </div>

            <div class="col-lg-3 col-md-4 col-sm-6 a2018 all">
                <div class="gallery_item">
                    <img class="image" src="Images/Default/insta_gallery_1%20(9).jpg" /><div class="blur"></div>
                </div>
            </div>

            <div class="col-lg-3 col-md-4 col-sm-6 a2018 all">
                <div class="gallery_item">
                    <img class="image" src="Images/Default/insta_gallery_1.jpg" /><div class="blur"></div>
                </div>
            </div>

        </div>
    </div>
    <%-- Modal for image --%>
    <div class="modal fade" id="ModalForImage" tabindex="-1" role="dialog" aria-labelledby="ModalForImage" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header imageContent">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body imageContent">
                    <img style="width: 300px; height: 300px; align-content: center" src="Images/default-thumb.png" id="pushImageForModal" />
                </div>
                <div class="modal-footer imageContent">
                </div>
            </div>
        </div>
    </div>
    <script>
            $(document).ready(function () {
                $("div").filter(".all").show("fast");
                $(document).on("click", "div .all", function () {
                    var ImageSrc = $(this).children().children().attr("src");
                    $("#pushImageForModal").attr("src", ImageSrc);
                    $("#ModalForImage").modal('show');
                });
            });

    </script>
</asp:Content>
