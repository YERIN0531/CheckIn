<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>   
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css'>
    <link rel="stylesheet" href="./style.css">   
    <link href="${conPath }/css/main/intro.css" rel="stylesheet">
    <title>Insert title here</title>
    <style>
                         @import url("https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap");
        @import url("https://fonts.googleapis.com/css2?family=Cormorant+Garamond&display=swap");

        * {
            box-sizing: border-box;
            user-select: none;
        }

        a {
            color: #fff;
            text-decoration: none;
        }

        body {
            margin: 0;
            padding: 0;
            height: 100vh;
            color: white;
            background: black;
            font-family: "Cormorant Garamond", serif;
            text-transform: uppercase;
        }

        h2 {
            font-size: clamp(1rem, 5vw, 5rem);
            font-weight: 400;
            text-align: center;
            letter-spacing: 0.5em;
            margin-right: -0.5em;
            color: #cccccc;
            width: 90vw;
            max-width: 1200px;
        }

        header {
            position: fixed;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 5%;
            width: 100%;
            z-index: 3;
            height: 7em;
            font-family: "Bebas Neue", sans-serif;
            font-size: clamp(0.66rem, 2vw, 1rem);
            letter-spacing: 0.5em;
        }

        section {
            height: 100%;
            width: 100%;
            top: 0;
            position: fixed;
            visibility: hidden;
        }

            section .outer,
            section .inner {
                width: 100%;
                height: 100%;
                overflow-y: hidden;
            }

            section .bg {
                display: flex;
                align-items: center;
                justify-content: center;
                position: absolute;
                height: 100%;
                width: 100%;
                top: 0;
                background-size: cover;
                background-position: center;
            }

                section .bg h2 {
                    z-index: 2;
                }

                section .bg .clip-text {
                    overflow: hidden;
                }
        .first .bg {
            background-image: linear-gradient(180deg, rgba(0, 0, 0, 0.6) 0%, rgba(0, 0, 0, 0.3) 100%), url(https://images.unsplash.com/photo-1617478755490-e21232a5eeaf?crop=entropy&cs=srgb&fm=jpg&ixid=MnwxNDU4OXwwfDF8cmFuZG9tfHx8fHx8fHx8MTYxNzU1NjM5NA&ixlib=rb-1.2.1&q=75&w=1920);
        }

        .second .bg {
            background-image: linear-gradient(180deg, rgba(0, 0, 0, 0.6) 0%, rgba(0, 0, 0, 0.3) 100%), url("https://images.unsplash.com/photo-1617128734662-66da6c1d3505?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxNDU4OXwwfDF8cmFuZG9tfHx8fHx8fHx8MTYxNzc3NTM3MA&ixlib=rb-1.2.1&q=75&w=1920");
        }

        .third .bg {
            background-image: linear-gradient(180deg, rgba(0, 0, 0, 0.6) 0%, rgba(0, 0, 0, 0.3) 100%), url(https://images.unsplash.com/photo-1617438817509-70e91ad264a5?crop=entropy&cs=srgb&fm=jpg&ixid=MnwxNDU4OXwwfDF8cmFuZG9tfHx8fHx8fHx8MTYxNzU2MDk4Mg&ixlib=rb-1.2.1&q=75&w=1920);
        }

        .fourth .bg {
            background-image: linear-gradient(180deg, rgba(0, 0, 0, 0.6) 0%, rgba(0, 0, 0, 0.3) 100%), url(https://images.unsplash.com/photo-1617412327653-c29093585207?crop=entropy&cs=srgb&fm=jpg&ixid=MnwxNDU4OXwwfDF8cmFuZG9tfHx8fHx8fHx8MTYxNzU2MDgzMQ&ixlib=rb-1.2.1&q=75&w=1920);
        }

        .fifth .bg {
            background-image: linear-gradient(180deg, rgba(0, 0, 0, 0.6) 0%, rgba(0, 0, 0, 0.3) 100%), url("https://images.unsplash.com/photo-1617141636403-f511e2d5dc17?crop=entropy&cs=srgb&fm=jpg&ixid=MnwxNDU4OXwwfDF8cmFuZG9tfHx8fHx8fHx8MTYxODAzMjc4Mw&ixlib=rb-1.2.1&q=75w=1920");
            background-position: 50% 45%;
        }
    </style>
</head>
<body>


    <header>
        <div>Premium Trip Service </div>
        <div><a href="${conPath }/main2.do">MAIN</a></div>
    </header>
    <section class="first">
        <div class="outer">
            <div class="inner">
                <div class="bg one">
                    <h2 class="section-heading">CHECK IN</h2>
                </div>
            </div>
        </div>

    </section>
    <section class="second">
        <div class="outer">
            <div class="inner">
                <div class="bg">
                    <h2 class="section-heading">Hotel</h2>
                </div>
            </div>
        </div>
    </section>
    <section class="third">
        <div class="outer">
            <div class="inner">
                <div class="bg">
                    <h2 class="section-heading">Air</h2>
                </div>
            </div>
        </div>
    </section>
    <section class="fourth">
        <div class="outer">
            <div class="inner">
                <div class="bg">
                    <h2 class="section-heading">Dutyfree <br>&<br> Board</h2>
                </div>
            </div>
        </div>
    </section>
    <section class="fifth">
        <div class="outer">
            <div class="inner">
                <div class="bg">
                    <h2 class="section-heading">Keep scrolling</h2>
                </div>
            </div>
        </div>
    </section>
    <!-- partial -->
</body>
</html>
<script src='https://assets.codepen.io/16327/gsap-latest-beta.min.js'></script>
<script src='https://assets.codepen.io/16327/Observer.min.js'></script>
<script src='https://s3-us-west-2.amazonaws.com/s.cdpn.io/16327/SplitText3.min.js'></script>
<script src="./script.js"></script>
<script>

    gsap.registerPlugin(Observer);

    let sections = document.querySelectorAll("section"),
        images = document.querySelectorAll(".bg"),
        headings = gsap.utils.toArray(".section-heading"),
        outerWrappers = gsap.utils.toArray(".outer"),
        innerWrappers = gsap.utils.toArray(".inner"),
        splitHeadings = headings.map(heading => new SplitText(heading, { type: "chars,words,lines", linesClass: "clip-text" })),
        currentIndex = -1,
        wrap = gsap.utils.wrap(0, sections.length - 1),
        animating;

    gsap.set(outerWrappers, { yPercent: 100 });
    gsap.set(innerWrappers, { yPercent: -100 });

    function gotoSection(index, direction) {
        index = wrap(index); // make sure it's valid
        animating = true;
        let fromTop = direction === -1,
            dFactor = fromTop ? -1 : 1,
            tl = gsap.timeline({
                defaults: { duration: 1.25, ease: "power1.inOut" },
                onComplete: () => animating = false,
            });
        if (currentIndex >= 0) { // The first time this function runs, current is -1
            gsap.set(sections[currentIndex], { zIndex: 0 });
            tl.to(images[currentIndex], { yPercent: -15 * dFactor })
                .set(sections[currentIndex], { autoAlpha: 0 });
        }
        gsap.set(sections[index], { autoAlpha: 1, zIndex: 1 });
        tl.fromTo([outerWrappers[index], innerWrappers[index]], { yPercent: i => i ? -100 * dFactor : 100 * dFactor }, { yPercent: 0 }, 0)
            .fromTo(images[index], { yPercent: 15 * dFactor }, { yPercent: 0 }, 0)
            .fromTo(splitHeadings[index].chars, { autoAlpha: 0, yPercent: 150 * dFactor }, {
                autoAlpha: 1,
                yPercent: 0,
                duration: 1,
                ease: "power2",
                stagger: {
                    each: 0.02,
                    from: "random"
                }
            }, 0.2);

        currentIndex = index;
    }

    Observer.create({
        type: "wheel,touch,pointer",
        wheelSpeed: -1,
        onDown: () => {
            !animating && gotoSection(currentIndex - 1, -1)
        },
        onUp: () => {
            !animating && gotoSection(currentIndex + 1, 1)
        },
        tolerance: 10,
        preventDefault: true,
    });

    gotoSection(0, 1);
</script>