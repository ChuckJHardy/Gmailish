module Gmailish
	class SupportData
		def self.fake_fetch_data_response
      {"UID"=>111, "RFC822"=>"Delivered-To: venkmanapp+40f7f061c2f7254b1b50f699d9eac16a@gmail.com\r\nReceived: by 10.67.2.8 with SMTP id bk8csp76264pad;\r\n        Wed, 27 Mar 2013 07:37:43 -0700 (PDT)\r\nReturn-Path: <chuckjhardy@gmail.com>\r\nReceived-SPF: pass (google.com: domain of chuckjhardy@gmail.com designates 10.50.77.113 as permitted sender) client-ip=10.50.77.113\r\nAuthentication-Results: mr.google.com;\r\n       spf=pass (google.com: domain of chuckjhardy@gmail.com designates 10.50.77.113 as permitted sender) smtp.mail=chuckjhardy@gmail.com;\r\n       dkim=pass header.i=@gmail.com\r\nX-Received: from mr.google.com ([10.50.77.113])\r\n        by 10.50.77.113 with SMTP id r17mr2239264igw.89.1364395063322 (num_hops = 1);\r\n        Wed, 27 Mar 2013 07:37:43 -0700 (PDT)\r\nDKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;\r\n        d=gmail.com; s=20120113;\r\n        h=x-received:mime-version:in-reply-to:references:from:date:message-id\r\n         :subject:to:content-type;\r\n        bh=4VQaatCoScZcHWE3RJ0x5oxemkkqJcA8KSuLWATUz2A=;\r\n        b=eLqylx/txCVXYGKxv2XmyKUoA7WYcftCrFUuZlVadUShO/t+hCugIY/StTVJMwtwcH\r\n         i+b0pyWKWR6xe1F2Fsg/iTNf7zsBCAkMfRHWszp3iMOQ7X7L4dmZd9sSQ3FlYLHxbSgK\r\n         Qad+dCI8IzK6jwiRjz5wvR6zxa/IqvwkFHw4eNceIN4VUyqLSNS2xcB6QwOYVI0bLWXE\r\n         434beOnAd4jd+nQfz2yhm1ztoYFUT3HpUW2lq9WNtOVi8VDxcjS/hvw5+HG+EkviOu9J\r\n         S54pLriacYQhmi+Rlgl3YXVewaaEISxkgAG2X5c+tnFU5PL/F60B3QSRduMdAvqPXv4e\r\n         wo4A==\r\nX-Received: by 10.50.77.113 with SMTP id r17mr2239264igw.89.1364395063317;\r\n Wed, 27 Mar 2013 07:37:43 -0700 (PDT)\r\nMIME-Version: 1.0\r\nReceived: by 10.64.68.101 with HTTP; Wed, 27 Mar 2013 07:37:03 -0700 (PDT)\r\nIn-Reply-To: <-3268989094069137341@unknownmsgid>\r\nReferences: <-3268989094069137341@unknownmsgid>\r\nFrom: Chuck Hardy <chuckjhardy@gmail.com>\r\nDate: Wed, 27 Mar 2013 14:37:03 +0000\r\nMessage-ID: <CAL2fzerGytNXJ0k+HwEfHq_sZxnRU5i0shSmXUrUKVr9EJd9Sw@mail.gmail.com>\r\nSubject: Fwd: Raising and Rescuing Custom Errors in Rails | We Are Stac\r\nTo: venkmanapp+40f7f061c2f7254b1b50f699d9eac16a@gmail.com\r\nContent-Type: multipart/alternative; boundary=047d7bd76900151d2e04d8e8fb12\r\n\r\n--047d7bd76900151d2e04d8e8fb12\r\nContent-Type: text/plain; charset=ISO-8859-1\r\n\r\n---------- Forwarded message ----------\r\nFrom: Chuck Hardy <chuckjhardy@gmail.com>\r\nDate: 27 March 2013 09:29\r\nSubject: Raising and Rescuing Custom Errors in Rails | We Are Stac\r\nTo: ChuckJHardy <chuckjhardy@gmail.com>\r\n\r\n\r\nhttp://wearestac.com/blog/raising-and-rescuing-custom-errors-in-rails\r\n\r\n\r\nSent from my iPhone\r\n\r\n\r\n\r\n-- \r\nChuck J Hardy\r\n\r\n--047d7bd76900151d2e04d8e8fb12\r\nContent-Type: text/html; charset=ISO-8859-1\r\nContent-Transfer-Encoding: quoted-printable\r\n\r\n<div dir=3D\"ltr\"><br><br><div class=3D\"gmail_quote\">---------- Forwarded me=\r\nssage ----------<br>From: <b class=3D\"gmail_sendername\">Chuck Hardy</b> <sp=\r\nan dir=3D\"ltr\">&lt;<a href=3D\"mailto:chuckjhardy@gmail.com\">chuckjhardy@gma=\r\nil.com</a>&gt;</span><br>\r\n\r\nDate: 27 March 2013 09:29<br>Subject: Raising and Rescuing Custom Errors in=\r\n Rails | We Are Stac<br>To: ChuckJHardy &lt;<a href=3D\"mailto:chuckjhardy@g=\r\nmail.com\">chuckjhardy@gmail.com</a>&gt;<br><br><br><a href=3D\"http://weares=\r\ntac.com/blog/raising-and-rescuing-custom-errors-in-rails\" target=3D\"_blank\"=\r\n>http://wearestac.com/blog/raising-and-rescuing-custom-errors-in-rails</a><=\r\nbr>\r\n\r\n\r\n<br>\r\n<br>\r\nSent from my iPhone<br>\r\n</div><br><br clear=3D\"all\"><div><br></div>-- <br>Chuck J Hardy\r\n</div>\r\n\r\n--047d7bd76900151d2e04d8e8fb12--\r\n", "FLAGS"=>[:Seen]}
    end
  end
end