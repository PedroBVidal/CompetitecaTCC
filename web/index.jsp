<%-- 
    Document   : index.jsp
    Created on : 01/10/2018, 09:16:10
    Author     : Usuário
--%>
<%@page import="java.util.Date"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeSolo"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeColetiva"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante2"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Competicao"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoControle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="pt-br">

    <head>
        <link rel="shortcut icon" href="img/favicon.ico">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Competiteca</title>

        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <!--<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">-->

        <!-- Custom styles for this template -->
        <link href="css/modern-business.css" rel="stylesheet">

    </head>

    <body>

        <%
            Object usuario = session.getAttribute("usuario");
            if (usuario instanceof UsuarioParticipante2) {

        %>

        <header>
            <jsp:include page="navbarUsuarioParticipante.jsp" flush="true" />
        </header>

        <% } else if (usuario == null) {

        %>
        <header>
            <jsp:include page="navbarindex.jsp" flush="true" />
        </header>

        <%} else if (usuario instanceof UsuarioParticipante) {

        %>
        <header>
            <jsp:include page="navbarUsuarioAdministrador.jsp" flush="true" />
        </header>

        <%}%>




        <header>
            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="5"></li>
                </ol>
                <div class="carousel-inner" role="listbox">
                    <!-- Slide One - Set the background image for this slide in the line below -->
                    <div class="carousel-item active" style="background-image: url('http://slpr.net/wp-content/uploads/2018/12/volleyball3.jpg')">
                        <div class="carousel-caption d-none d-md-block">
                            <h3>Competições de Vôlei</h3>
                        </div>
                    </div>
                    <!-- Slide Two - Set the background image for this slide in the line below -->
                    <div class="carousel-item" style="background-image: url('https://s.yimg.com/ny/api/res/1.2/umHJJQAzal.Ar.laG6bGWQ--~A/YXBwaWQ9aGlnaGxhbmRlcjtzbT0xO3c9ODAw/http://media.zenfs.com/en/homerun/feed_manager_auto_publish_494/b427d19dd6238628dc7fa8acc2c212d3')">
                        <div class="carousel-caption d-none d-md-block">
                            <h3>... de Basquete</h3>
                        </div>
                    </div>
                    <!-- Slide Three - Set the background image for this slide in the line below -->
                    <div class="carousel-item" style="background-image: url('data:image/jpeg;base64,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')">
                        <div class="carousel-caption d-none d-md-block">
                            <h3>... de Futsal</h3>
                        </div>
                    </div>
                    <div class="carousel-item" style="background-image: url('https://fatonovo.com.br/wp-content/uploads/2019/10/futebol-bola-0.jpg')">
                        <div class="carousel-caption d-none d-md-block">
                            <h3>... de Futebol</h3>
                        </div>
                    </div>
                    <div class="carousel-item" style="background-image: url('https://4.bp.blogspot.com/-wptEYzmN1qs/U4DbkS1mgwI/AAAAAAAALuQ/PRphkqVderA/s1600/handebol+Brasil.jpg')">
                        <div class="carousel-caption d-none d-md-block">
                            <h3>... de Handebol</h3>
                        </div>
                    </div>
                    <div class="carousel-item" style="background-image: url('data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxMSEhUSExMVFhUVFRUVFRUVExUVFhUVFRUWFhUVFRUYHSggGBolHRUVITEhJSkrLi4uFx8zODMtNygtLisBCgoKDg0OGhAQGyslHx8tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tK//AABEIAK8BIAMBIgACEQEDEQH/xAAcAAACAwEBAQEAAAAAAAAAAAADBAIFBgEHAAj/xABFEAABAwEFBAYFBwwCAwEAAAABAAIDEQQFEiExBkFRYRMiMkJxkQdSgaHRFEOSk7HB8BUWIzNEU1RiotLh8XKDF4Ky4v/EABsBAAIDAQEBAAAAAAAAAAAAAAECAAMEBQYH/8QAMREAAgECBAQFAwMFAQAAAAAAAAECAxEEEiExBRNBURQiMmFxkaGxQoHRBiNSwfAV/9oADAMBAAIRAxEAPwDON2esx0ml+g34orNl4D8/J9W3+5AZZ3/ghHbC8b/6gufZ9zsrGVe4VuyEJ/aH/VD+5SGw8Z/aXD/pH9642N/rf1j4phgf649sjfihr3G8bVfUgz0ex/xZ+p//AGp/+OWn9rHtgP8AejscRrKz6xvxRRaKfPRj/tb8VM0iLFVO4uz0aD+Mb9Sf70RvoxO61s+qd/cmWW4fxEf1rfijMvFoz+Ux/Wt+KF2N4yt3Eh6L3/xcf1bv7kSP0ZSD9pjP/o74p4XrH/Ex/WBTF9xD9qj+mhKTasx4Y7ERd0/sJH0by/xEf0XfFGg9H0gFOni8im23/D/Es+kitv8Ag/iGe8oQeX0jV8diqi8/4E3+j2Qj9fH5FLj0aTV/XxeTlb/nBAP2geRXPzns4/aPcVbzJGSVao9yol9Gcx+ei8nIEnovtB+ei8ir/wDOqzD5/wBxUTthZh897keZITmzM5/4ptP72LycoO9FVq/eRf1LSjbizfvj5L4bdWb96UVUmUyd3qZkeiy1+vF/V8FB3ostfrxebvgtX+flm/elcO39n/eFB1Jdi2jUnB+RGRd6L7Zxj+kfgoj0ZWzjH5n4LWu9IVn9c+aE70iQ7nFLnZrWKxH+JRRbAWtvqH/2PwRRsNauDPpH4K3HpBYdK+9d/P8AZz8is7yX1OzSxvE8qy09PgoZ/R3a3DWMe0/BV03owtnrR+Z+C083pGaP9FJy+k78UV9N2XlOZisTipy/uR1MvL6PLW31PM/BVdp2FtX8vmVr5vSQT/pVs/pGPD3K1Sqdjm1ZtrzIyztjLSNQPegP2UnG4LRTbfk7vckZdtnHd7lYpVOxlaiUr9m5huCA+5ZRuVtNtY47glJdoHHcnTmJaJXOu543IZsjgmpL0cdyWfbCU6uK8ou5tFxdcariYU0UllbQ9UIj7KynZbuOi+libQ5e9SljYB3eG5Ybv3PX8qOvljt/3Q+mszKdluo3DiozRMA0bqNwRJOjAp1dw3cV2VzKZU1Gg5pE37lsoQ19Owo9rKjs68kXCyu7TgF17hiGuvA8EXHnodOH44JmyuMI3e2/YhE1tTp5f4UgG4dP6efgjwMJJ6rtRw4eKOyI4K4NeY3lPEOeKX16AmUqMjoe74L4d7I+SsRA+oo0aHveHJRNjccRyGfPghLVWHpV0p3f4AYtOqfcraxMPR5NrnxpvSzLtfVoxDyVhHE9rSA6nW4c0lKLjuX47EwqQtFs7JC/rdUdnjyVS9juA0VzID1qybuXBU89Muvu4rSjiTYOdjqDTRJva7iNE9IG0GZ0Sjmimh0TNFDYmBzUXDmi4eSi8ckUYam5Fo5qLgjNHgoO1SzNuCV2BcFJoXzwpNCqR1UvMP2UZIzlGytyRHtXOk9T1lKNqaKu2FV0jgrN8NXUS1rgDdy6lCF4I8ZxSu41XcRc8JSYI1oHKiWKty2OFUrORHCuFi7VcJRKMx9gXMC7VcqoLc+wKOBdxLmJTUlwroMlDokeR/VS+JTULNHJEzLIajXxUnvjFOzqOCJNZWADJo6zdacQiv6MUo5lcTdCOPJYL3tudx8Wgr2gtQLp2ZUI1GmfHgpumqQAHa+q7geSakc2rKYj1hox/AjgmXRuJbSOTtbwBuPEqptaXRJcclrZLX2KtzXFw6rt/AfaUaGB5ceqcgN4HFW/yaTG0dFSod2njlwBTMFglL3CjB1WnVx9bwVcqyS6fUzT43V1syqszH1dRoyO93IckUNkwN7OZbxO9XNkumQl9XgdbczkOJRRdB6Nhxu1ZwG/wSvF9mYpcSqvqVbYpMQ6w0Pd5+K+ELsL6vOvADgrw3XGHDE/cdX8/FfMsMIDqDF1tzS7eFW8Wyl46p3KnAMQrIaUPe+CmGR03nrcytA2xtxtwxO0PdA4cUZtgfTKMDrbz8EPGSFePmZ8htHUjPkgy2InSPurVm65CHZtGfBfPu3WsndGlEfGzEePmZc3c+mjRkhPug0zcBkOC135Oj5nIcVP8nt3Rncp42oJ4+ZiDcw4nyKE+5eTl6D8gPqgLjrEeI9iPjqgjxkmYBtwuOjaeK7+bx3lbw2IcyvvkP8ALxQljqjLqXEp09jz+TZ881H8gO3Ar0P5GufI0vjZmmPGaid7GHiuaQDcovu6Tgtw6yKBsip57OzD+rqsY2cTAtul4dUpK97tkLcuPBejPsiXksNdQtlPiLhG1ji4virxEszR5MbnlOqC66JBuXrD7AOASVogjbrRMuJSfQx89HmL7skG5Ddd7xuXoE5aey2qXddrn7qeCuWP7j85GBfA4aqIs7juXoTNnBvCN+RmgUomfEYdCc1HmmAqXQO4Fb2S4BWtF8LoaNybx8AqrEwDmu4FQwngfJbyS6W8EF10N4Jlj4EdRB7TYoWMcf0bSMx2QcjX7vempLRDgNHtNKHqVdoQe74Jo2eztYQREwEH1G6hHs9vjdCAMTi6OlGRvdmW0pVooubnbS0k9SrMwVomGGrY5TRzXfqy0ZOHrU3VTc7ZC0EQltHMNXvaO8NzaoxtTnwHDBI7FGTX9G0Zt1zdX3JwvnfFURxAFmKrpHOOldA371U9Oi36sRyAyQz4o+rE2ryK1e+lWu5BOR3fKZOtKBVvcjA0OnWJ4o1ogmLWu6RgGNh6ke4uArVxPHgmjYCHMxSyGuIHrBm6vdA4FVX+BHJgLNdHXeHSSHsnt4dRTugcEP5BZmxDEWkgjV5ccncKpwQ2ZshxFrjhB6zi85E8SUxFaIxG8MicQC7sx4RrXU0QuxW2fR2eEObgjJyPZjPLeU5DY3ESBsdM+84DcNwqi9NISwhgG7rO4jl4IjelPSAuAy3N5cSmSQrDfktxLDVoyOgrw4lSddWXWkPa3UCEZf1ZdKTyrrlwC6ZW0NGl1HDcePNPaPYmh19gh62ZO/UlQdZW54Y+6m+kfnRgGS+JdvcB1UbIFkK/J3U7LRkoOgyzdu3Jjq5VJdkpNpTJm7ehlRMokYW8yu9Bwb5pup4geC7gHMoZQZRJ0XMexcMI5nVP9DyAXzoxx4oZA5Cu6LkuGFPODRqQqq2X1DHliBPAZlK4kyMIYlCSMD/KRFvmlyiiNOLuqERtw2qTtvDRwalyt7EyArTa2N1KrJrxrkxtVpLPsqxubuseeafjupjey0eSPKYbWMN8knk5BFj2c3uK25sZ4ITrEVOXIl2Zhl0MbuqifJBuCvnWRDfAlyPqC7KN1jQn2QcFduhQXQJWiXKKSypZ9jWhfAl5IUrbBmKB9kSslmV/LElJYkFNjZinu59njY3EYmuAwnsgkt6py13Jy67wYGYWNkfhc5owxupQONBUgDSm9Au602eIOaHRto99A3DWlagBrczqmbst3WlwRSvrLUUZgGbGVzkLd9VvlG+bR/uXjF1zylmFkFA1z2/pJGtoA40FGhxyFExdMc74W9eJgoW0DHPORLaVLgN3BQu585MmGNjP0hJxyFxBLWnstFPemrsskpaQZi2j5BSONre+TkXYuKSVlfb8/wAisj8hc6zYnSymkYdhBawdUVp1RXdxTNqs9naYy4tJxiuN5eaEEaOJ4hCjsMQhPSuJoHtHSSmmRcBRtQNw3JmO1QCNvRMqSWfq46jUd4CnvSMAzHaYxI3Axxqx3ZjoMiDqaJiN8rukAjABPfdxaNw+KjJNIXswxU7Qq9wGo4NrwR4YpS54LwK4TRreVNT4IJAsdbBIWsLn0oW9lvKmpUjHGHnE8uJaMi6vuCAIoxG0vkLiKZF9dD6oTUb2h46OInq60AGvEooljjHtwswRnUbqceKbPSHFk1unNBHSFgrhbn40zXZA3rYnlxpu/wAJiWCO1OKTu6BcZhyo0nLevmH1Wd3UqL7QGgF8jWilNQoCwYYqaNbko1G9xOW5UFs2tscesmMiooM/sVQ/bWSTq2ezudurTJMovsHIzb14N9pS1qvCOMVfI0e0LHtsV6WntPETTw1VhZPR+wnFPI+Q/wAzjTyRy+4cqJ2rbOBpwxh0juDQT9iC23260fq4hG0736+QWpsNywRCjI2j2J8EDSimUNkZGz7KTPznneeQOEe5XVg2cgi0aCeJFT5qxdMo4iUUkBh4w1ugCl0yAGqQKdOwBgZ6ogoEoXqDpUc9iXG3ShBfKEs55UUrm2LmZN7ggOaFIqJVTYLg3RBCdEERxQXFVsFwUkASskCZel5FWyaCc0CSlhKfkKVlJVMkiaGau28YGOla0toHigibiJGBm5gO+qcsd4OMknRwSOrgNXYYx2SBXEcW7gkrFeUQkcIyXgtblEwuFRiBzaKDuptlqlMwwQ4S9lKyvArgNR1WYvXPBdGUdXddOrNI7YflLnyAmKKpa6gDpTQsAGfVHdKasd3EmQSTSnr1oHdG0hzQa0YAeO/ck47PMZevMG42UHRMA7BrSr8W5xzoEQ2azsld0z8VWtI6WQuqQXA9UmnDcq37fZCjdgdZY8TaMLmucMh0jyDmNKnvJmz2txgAZE84W5OdRg6h557uCWsNvaHvbDC5w6pFGCNulDm6mWW4I1kE7mPALIxikFKF7s6mlTQDVKwWLCYTEMcXMYA5vZBcaOy1OW/gukRiXryl/U0xVzDvVb4qnvC2WaOJpmnxEYDhc/gRXqNSFr25s8Th0ERdkRWgYDvGue5NGnKWyGUGaizyARu6OI0xOoSA0drnmnJJXhzcT2MFD928ry6fbi1SY2MwsBJoGNLnZ7q/4UILmt9rwlwkPOVxa3y/wreQ16nYbl9zd23aCyRNIfNjc12gNd/AKntvpGYCRDDWo1cae7VRu30cn5+XL1YxQea1V2bK2SDsxNJ4uzPmUbU17ktFGIZfN5WqnRtc0cQ3CPNybs2wVpmobRORnWgJJ9+S9HY0NyAA8F0vUzW20BfsZm69hLLDQluM8XZrRQWWNgo1oHgF8+cBD6UnQJHJdQNMZL0N06F0ZOpU2xgIZhdT7pCdF3Ad6mF1EBxrQp1UKrlUbgJkqJK5RAnt0TO09o9qm4VFvYNmvqKqk2ks4+cHsSz9rbMN5PsKmWXYZUZ9i9IXFnnbZWf+byK4NsrMdSR7Cpkl2D4efY0BQ3FU7dqrKfnKeKMy/LO7SVvmFXKMuwrpSXQdcUJyiLUx2jmnwIXziq2VuLBvQJEV5QJCkZLAJEpImZSlJCqmSxl23kOkYY45HVDmdnA097IvpphOnFM2mW0ExmkcY6QCtTI4YmubmMhv4rK27awkfo4s2kODnnQg+qOVRrvSVuv20yNIdJhGRowAb6jPM7uK7UcJN2dkvnVmrls3tsY1jo3z2hxbVwNXiNoq00NGUyyprvSj9pbFBIHRNxktc09GzU5EHG7XQrBssz5j1WvkdlxcdRq7OmXNX9h2OtElC8tiGufWd5D4ouhTgv7kv9Bypbsftm3UpkrHGxlW0q4l5yNRlkK5lVD73tMznAySuxEHCyoFdOy1bC79irO2hkLpDzOFvkPvWnsNjiiFI2NaP5QAqHXow0hEGeK2R53dmyNqlb+rEYPefQHXWgzK1F3+j+IUM0jnkbm9UfFaoSBctFtbG0vdkB+KBVSxE5ewY56klGO76HbuuazwD9HE1vOmfmmLTecUfbeByrn5LH3hf8kuTKsb/UfE7lWjMpNep6fCf005LNiJW9l/JsJ9qox2Gudz0CTk2qkPZY0eZVA0KTQjY7NPg+Dp7Qv86ls6/wCc94DwAQnXlM7WR3nRVxeF0PJ0Qsao4SjH0wS/YbdapP3jvMqHy6UaSv8ANDbEd6M2PkhZByU10X0JsvO0bpHeabhva0Dv18QEs1qmApYpnSpS3gvoW0G0Eg7TWnwyT8F+xu1q088x5hZuq5VSxzq3CcLV/Tb4NxGQ4VBBHEZquvm+GwCgFXnQcOZVLdLpekDYaknu90jnw8Von7FiZ7pZpSC7usAyy0xHXyWihSc37HncTw2GGqayuvuYm3XxNIc3kDg3IKrefavQ7Z6PWEfop3A8HtDh5ilFiL7uiWzPwStpXsuGbXeB+7VbeXl6DwcNolW8ILiiOKC5MhwbihOKMUJ6dCsC5DcFN9UJwRFOCUjQkeBITdnv60R9mV3gc0g9CclcIy3Qkop7o1Vl25eMpIw4cW5HyV/YNoIJ8mvo71XZFeYuQnFZ6mBpy9Ohmnh4PbQ9fkKVkcs7shfTpQYZDVzBVrt5bWhrzFQr2Ry5FWk6cnFmKcHB2Z55ZdmHO/WSBoOoYKn6R+Cv7Bs9Z2U6mM8XnF7tPcpMmCZjkPCnitlTEVZ7u3wWtstbPQCgAA4CgCabMAqljwMyfuCLHax3QT4fErK13K2XDJT/ALRRIBqVVxl7t+Hw1801DAPE8SgLccbah3QTz3eaz21Nsc4xt7tSSBx3ferq1y4Wrz28r3PS51INagHOgO48R8Vow9N1JHT4PWVHFQqSV0i5j3I2IKnhteIVYQ5o4aj/AJN7v2c0/Zo8WZd5Zq6dNx3PpEKkKkc0ZaBnz55I0cbjyXIwBom2GqrYs5WWhBlnCOyNTZGVMtpmUpnlUuca1TAS77WwCta/8QXe8ZBW9z3b07WyYsLXCoBHWoeSmVmepWjBXkxGq44ra2PZqz97E/xdT3BMWvZezSNw4C3gWucD7jmnVNs5z4rSTtZnncjhv95ooMtFTQZ/8QXf/NVtodioGGpBdzoPt196heNtsdkBxBvVFTiOTfFx08FQ5O9rDy4rT/QmxjZ6EQRAkdd4DnEjMA6N5Ky/KSrxMHgEHIio8DogvGa6tOSUUkcSrec3KXUu2W9AvizMtULon0zHVO9rtzgqfpaJmz2lLKrYVUrnl9ru20sJDohkSK1eBllkSylPavrrui0Wh5YyMZdpxe3C3xpnX2bl6FdW1jJbVLZiWkxvLRQ5gjc4eea0oaNclkWIq3aasM2ux5fNsLahp0Z5B5H2tVFetzT2cVmic1o71MTR4ubUD2r2t8wVJets3DOuXmkljnT31Gp0nN2PF+madHA+BCg5em2rYGzSVke7A52ZbhiLAeQc2o81SWvYKyjS1QDx6h82yfctsMZTkuokqdna5h3HmhPK0Vt2QjZ2bZB7LVn5OaftWXvENifg6YOpSpDQ8exzSFphOM/SymUZHzihPcgPtzP5z9Fo+8qAt7hmxrWfzau+m77lbZiZWazZKHo5HF2Ty2mH1QSNeBNBktU59c1htnARR2dXGtTqRxK1sb81wsbrVbMGIs56FGy0jQZ+A+9Hje88vefNLxBNRlGVhGxqCEb8zzVhFkq+JybicqZCMsInJqMpCJyajf8AjX/SQUYnjxNovMNsLvfG8OFRQ1B/2vT2v/H+UveFjjmbRwrz3+avw9blTuPCWU8lslrY6hx9DJzqGHm147HgcuatxeU8eb42uHrgEV/7IiAfbVdvvYeZpLom428BqPYVmjZ54Tl0sZ30xN86aruQqU6iumdWjxKcVrr+TWw7UNpQseObZGu8sTa+9Pw7Uw0+dB5sjI56FYM3lN3nB3/JjD55VUTb3+qz2NI+wqOhF9EdCPF9NXL6nr12WiCZgkNokoa5CF+459gBW9ks1hLTIXSOw1rWMtdzw1GL3rwtl5zgYWyuaODTQZrovO0fvpPplUSwSfUy1OJzberse9xXrdrcuhkNN74JH/8A1VElvuyVBhlDT6haWeFA4CngvBGXraB89J9Ip2zbRWlur8Y4PaD71W+HxWqbKY42zuz9CXbeofoc1d2e111XiWzl/B2bMiO1HXs82cRyXol0XuHAVNeazzi6bNKcKq03NqHVXnG3no1Nrd0sEpae9E4ksPNnqn8ZLaWe1J6OQFPGfVblE6bjoef3TjgjZDJUFjQzrakNyFU38szPgFqr1uuOdtHZHc4ZEFeabQ2O12I4i3povXbkQP5m7llcKie48Klo2fQvZLSl32t4DjG0ucASAN5Giw8u1zu7HnzPwWz2CmmmaS4AN35UqdyWanGzkLLE38tPdiPo72YfE99snH6eUuoDnhDjVx8XH3LbSPJ3lWUTKCgSlvFCCsuKc5eeTNNGytGwu6y5Zk+ax+116CxxueHZt00JxHQU4rcTvGGvJeR7eWN1pkZGHUa0lx3kuOQAHhXzVtGjTc459hquIdOk2Yq89rp5iS4k83uJ9yrjfMv8v0f8rYWbYAHtOd7SB7qJ+P0eRbyT7SuusXhY6JfY4jrt9Tz518TcR9EIDrYXGrhU+0fYvUo9hoG90HxzTDNloW6NA8APgh/6FFemIFiGtjyyCCZ/YjpzI+8q4sFwEkGQl59Xd7eK335FjHPxUxZQ3Sg8AqKnEZNeVWFlWcupVWKx4czqnmtRi0BCe5YJScmVN3KFjkywpKMplrvxvWiSCx2M/jT/ACmYnZfgBV7ZEVsqqaFZaRS/jQIzJ1XRNJT0DQFU1YUciJKchYPFKRvTEbkCDzCuyWdj+01p8QCgscjsciiCj9nbM7WJvsCCdjrKfmx5K3a5Ga5WKb7kKE7D2Q/NjyCg7YCyHuLSBykHp88u7+pDFWv0Y2dw6j3MPmPIrJ3tsBaIalpbIBwyPkvY8aHaGBwVscTUj1v8jKTR+fAJIXg5scPZ/tbXZzaAPyPVfvG53MK22quAPBIGf2LzS0wPhfvBByK2wqRrKz3NNOq4O6PcbqvnQFaWy2yuYK8S2f2jxUY80eNDuctpd18FpzKz1KTgzrUq0aiPSYrTVTnLSKOpQ61WKtW1LI2VrU7gsZe+0s857Ra31WmiVXkgThGL3NTfmydjLzJEWtfrhqMJPgut2kjsjRFGypGprQV3rzwF1a1NeNc1G9JzhaSeSqlRbkncFN0k27anof8A5AAPWZlvoVYxbV2ecANeA7gdV5B0AIBqfNcZFhNRWo3gq2phYyjYaNaKlex7Re1tDY/YsNYXdJKXnjX4JWS+nSRBrjmMk9czKNrxWKcXFWMGPrKTUVsi7iOaK5yWgK696rOadkegPeuPegPeiQ+e9LyPXHvQXuRSuMkfPcl3vXXuS73Jkg2KRkiKx9UvE1NRLZIYPE1ORABKsKYY5USFHGOTDHpJhTDCq2hWh6N6ajeq5j0xG9IAsmPR2PVcyRHbIoQsGyIgkSDZEVsiNwjokUw9JCRTEilwDgepB6UEikJEbkO2uEOCwO1Nxh1SAt/jSNvgDgnhNxd0PF2PDLRE5jqHIhX9yX/oyQ+DlZ7TXMDUhYieMtNCuxSnGtEvhNxd0bm1zAnMpR043LO2S9CBhdnwTAtg4lI6LRqVRS1Lb5Uq+9rR1Qa70s+8QOyKlI260F9K7k0KXmTYsqltEOxW8mmYA8UZ9t4OzVBgVlctjq/EdArqkYxVxHW0NTYGGgrqVrLN1WgLPXYyrq8FetdmuDWd5GOTu9SxjdkoPeh48kJ8irFJPegueuOegveikGx1zkB7lx7kFzk1hj57kB7lJ70B7k6QT//Z')">
                        <div class="carousel-caption d-none d-md-block">
                            <h3>... ou Tênis de Mesa</h3>
                            <p>Gerencie ou Participe de competições destas modalidade pelo Competiteca. Cadastre-se <a href="signup.jsp?p=1">aqui</a></p>
                        </div>
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </header>

        <!-- Page Content -->
        <div class="container">

            <a name='sobre'><h1 class="my-4">Seja Bem-Vindo a Competiteca</h1></a>

            <!-- Marketing Icons Section -->
            <div class="row">
                <div class="col-lg-4 mb-4">
                    <div class="card h-100">
                        <h4 class="card-header">Crie e Gerencie eventos esportivos e suas competições</h4>
                        <div class="card-body">
                            <p class="card-text">Crie eventos esportivos e suas competições no Competiteca.<br> O Competiteca possui suporte para 6 modalidades esportivas 
                            <br><ul>
                                <li>Vôlei</li>
                                <li>Handebol</li>
                                <li>Tênis de Mesa</li>
                                <li>Futebol</li>
                                <li>Futsal</li>
                                <li>Basquete</li>
                            </ul>
                            Além disto, possibilita competições em três formatos: liga, eliminatórias e eliminatórias com represcagem.<br>
                            Com estas funcionalidades, o Competiteca pode ser uma mão na roda para si.<br>Esqueça os papéis, utilize o competiteca!
                            </p>
                        </div>
                        <div class="card-footer">

                        </div>
                    </div>
                </div>
                <div class="col-lg-4 mb-4">
                    <div class="card h-100">
                        <h4 class="card-header">Nunca mais gaste tempo criando tabelas</h4>
                        <div class="card-body">
                            <p class="card-text">O Competiteca possui algoritmos que criam automaticamente tabelas e chaveamentos, assim você pode utilizar este tempo para outras coisas, como dormir ou pescar.</p>
                        </div>
                        <div class="card-footer">

                        </div>
                    </div>
                </div>
                <div class="col-lg-4 mb-4">
                    <div class="card h-100">
                        <h4 class="card-header">O seu time, ou do seu filho, estará jogando e você não poderá estar presente?</h4>
                        <div class="card-body">
                            <p class="card-text">Através do competiteca, você poderá saber do placar logo após a finalização do jogo!<br>Nada de ansiedade! Mais um motivo para indicar o competiteca aos organizadores, né?.</p>
                        </div>
                        <div class="card-footer">
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 mb-4">
                    <div class="card h-100">
                        <h4 class="card-header">É um esportista e não sabe onde encontrar campeonatos?</h4>
                        <div class="card-body">
                            <p class="card-text">O Competiteca é uma plataforma centralizada, aqui você pode encontrar todos os campeonatos e eventos esportivos num só lugar, interessante, né?<br> Além disto, possibilita o que, caso queira entrar numa competição em equipe, você possa requerer a entrada numa equipe que tenha interesse, possibilitando que você possa fazer novos amigos também!.</p>
                        </div>
                        <div class="card-footer">
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 mb-4">
                    <div class="card h-100">
                        <h4 class="card-header">Gostou?</h4>
                        <div class="card-body">
                            <p class="card-text">Sentiu-se interessado? Venha logo conosco!.<br> Clique no botão abaixo e inicie esta fantástica experiência!</p>
                        </div>
                        <div class="card-footer">
                            <a href="signup.jsp?p=1" class='btn btn-primary'>Cadastrar-me</a>
                        </div>
                    </div>
                </div>

            </div>
            <!-- /.row -->

            <!-- Portfolio Section -->
            <a name='comp_andamento'><h2>Competições em Andamento</h2></a>

            <div class="row">
                <%
                    CompeticaoControle cptcc = new CompeticaoControle();
                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                    int ct = 0;
                    //List<Competicao> cptcl = cptcc.buscarTodasCompeticoes();
                    int i = 0;
                    for (Competicao cptc : cptcc.buscarTodasCompeticoes()) {
                        Date dataHj = new Date();
                        if ((cptc.getDataInicio().equals(dataHj) || cptc.getDataInicio().before(dataHj)) && (cptc.getDataTermino().equals(dataHj) || cptc.getDataTermino().after(dataHj))) {
                            

                %>
                <!--Início Modal-->
                <div class="modal fade" id="<%=i%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-scrollable" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalScrollableTitle">Escolha uma competição a acompanhar</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <h3>Competições Coletivas</h3>
                                <hr>
                                <table class="table table-striped">
                                    <thead class="table-dark">
                                        <tr>
                                            <th scope="col">Nome</th>
                                            <th scope="col"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%  if (cptc.getCmodalidadecole().size() > 0) {

                                                for (CompeticaoModalidadeColetiva cmc : cptc.getCmodalidadecole()) {

                                        %>


                                        <tr>

                                            <td><%=cmc.getNomeCompeticao()%></td>
                                            <td><a class="btn btn-success" href="acompanharComp.jsp?idCompeticao=<%=cmc.getIdCompeticaoModalidade()%>" role="button">Ir</a></td>

                                        </tr>
                                        <%}
                                        } else {%>
                                        <tr>
                                            <td>Não Há competições coletivas disponíveis</td>
                                            <td></td>
                                        </tr>
                                        <%}
                                        %>
                                    </tbody>
                                </table>

                                <h3>Competições Individuais</h3>
                                <hr>
                                <table class="table table-striped">
                                    <thead class="table-dark">
                                        <tr>
                                            <th scope="col">Nome</th>
                                            <th scope="col"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%if (cptc.getCmodalidadesolo().size() > 0) {

                                                for (CompeticaoModalidadeSolo cms : cptc.getCmodalidadesolo()) {

                                        %>


                                        <tr>

                                            <td><%=cms.getNomeCompeticao()%></td>
                                            <td><a class="btn btn-success" href="acompanharComp.jsp?idCompeticao=<%=cms.getIdCompeticaoModalidade()%>" role="button">Ir</a></td>

                                        </tr>
                                        <%}
                                        } else {%>
                                        <tr>

                                            <td>Não há competições solo disponíveis</td>
                                            <td></td>

                                        </tr>
                                        <%}
                                        %>
                                    </tbody>
                                </table>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!--Fim Modal-->
                <div class="col-lg-4 col-sm-6 portfolio-item">
                    <div class="card h-100">
                        <a href="#"><img class="card-img-top" src="img/competiteca_default.png" alt=""></a>
                        <div class="card-body">
                            <h4 class="card-title">
                                <a href="#"><%=cptc.getNome()%></a>
                            </h4>
                            <p class="card-text">
                                <b>Período da Competição:</b>&nbsp;<%=sdf.format(cptc.getDataInicio())%> a <%=sdf.format(cptc.getDataTermino())%> <br>
                                <%  int inscritos = 0;
                                    if (cptc.getCmodalidadecole().size() > 0) {
                                        for (CompeticaoModalidadeColetiva cmc : cptc.getCmodalidadecole()) {
                                            inscritos += cmc.getNumParticipantes();
                                        }
                                    }
                                    if (cptc.getCmodalidadesolo().size() > 0) {
                                        for (CompeticaoModalidadeSolo cms : cptc.getCmodalidadesolo()) {
                                            inscritos += cms.getNumParticipantes();
                                        }
                                    }
                                %>
                                <b>Número de Participantes:</b>&nbsp;<%=inscritos%><br>

                            </p>
                        </div>
                        <div class="card-footer">
                            <button style="float:right;" type="button" class="btn btn-primary" data-toggle="modal" data-target="#<%=i%>">
                                Acompanhe
                            </button>
                        </div>
                    </div>
                </div>
                <%i++;
                        }

                    }%>
                <%if (i == 0) {%>
                <div class="col-lg-4 mb-4">
                    <div class="card h-100">
                        <h4 class="card-header">Não há nada para hoje</h4>
                        <div class="card-body">
                            <p class="card-text">Relaxe! não há nenhuma competição ocorrendo hoje; volte outro dia e veja as competições que estarão ocorrendo!</p>
                        </div>
                        <div class="card-footer">
                            <a href="signup.jsp?p=1" class='btn btn-primary'>Cadastrar-me</a>
                        </div>
                    </div>
                </div>
                <%}%>
            </div>
            <!-- /.row -->



        </div>
        <!-- /.container -->

        <!-- Footer -->
        <footer class="py-5 bg-dark">
            <div class="container">
                <p class="m-0 text-center text-white">Copyright 2019 &copy; A Oliveira & Vidal Software</p>
            </div>

            <!-- /.container -->
        </footer>

        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    </body>

</html>
