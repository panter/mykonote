# frozen_string_literal: true

class GetStartedNoteCreator
  TITLE = 'Get started'
  # rubocop:disable Metrics/LineLength
  CONTENT = "<h2><img src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAF0AAABdCAYAAADHcWrDAAAABHNCSVQICAgIfAhkiAAAFUVJREFUeF7lXQl4FFW2PtUhLIGwCwES1kwSAlERwr4YNkVBVGQTFVDHb0R0WBznzbi8JyrjAgRQ4L1hfDJGGQRBx4ciAgMRUJKAyIOQhTUBwg4JJIEE0jX/6U5336qurlR3V3fCx/m+TtJVdzn3r1vnnu3eSFQTad6utlQrJJas1hiyWDqTVY4hiZqC1Ub41K/8NMTvK/iUVH6KiOSLRFIuSVIWyTJ+V+TQjD4natoQpRrB0Pz01gCqH3gZSpJ8P363NY0vmc6ShX7EA9lMcq1NNLP7MdPa9rGh6gP9g4z2VEt+Enw/gU+Mj/z7Ug1vgfQZWSs+o5d75/vSgL91ggv60qw6dL14ImbzFDA+EJ/g9q9Eywo+UskqraDrdVbRn+8q9xdMo/WDM2gGu/zKZMyw18FYpFHmgljuDPpaSKXWD+nV3qWB7jewoL+9qS6FNZqB+TwLA7kj0IPxu32W/5I0n+o0WEzTOpf53Z6HBgIHenLaYEiPJeg3zkPfNfnyYWg/L9KsXt8HgknzQZ+/J5IsFQvB7JhAMBzUNiX6girwls7uWWBmv+aCnpwxGqrZJ2CwiZlMVnNbRRCPz9KMnl+axYc5oPNCWXb1fTD1Ij7mtGnWCM1pR0YzH9K1On8wQ8vxH6CF6e1IprVgqrs546vBrUiUThUhY2h295P+cGnxpzItTI8H4NvdAG8BS72Wf037xZejcvMwU5pxNiJTT6xXabQoLcGfhn1HZv7ungA8FZ1HqRlY268NFT53Ny27vyM16diYKMT/F0rdh8fvFom6xTalbeM70/WJ8R6L+XGjNQyqVFqU0dfXNnxDY2HafTB01qFTzam09pEYerQd+6bsdKmsguYdOE9/2XuWqDhAhh/erHFdW9Bf7mlBHRvWcfYtfbibqIJFsunEjraHaWbPzd627P1MT97VC4CzDNcEnBmosCrZaFonhOZ2j6CSKQn0Up82poue/vHN6djkBPri3igF4DYuQmt5i4nR8uzt/KcvM9470Oft7kJk+Q6dcYceqbC8wnlP/DsMs3FRr9aUMaEzUdN6HusbvoEZvX5MHG0f3oHah9fWrlbLt5dZuzG3q2FwO39D89MwIONkHHTWUkKsG9E0+7V16VLZTef9JutyadKPJ+hUyQ3ntR5Y4C6MA5+tGui2o3szsiFdeLwLPRgV7ixWetNKr+45QyzOnBRifIi6/Xm+2Yws0gZavBuvsDEyxhHr4Xa10FDD4qCbhNWilb+cocgVB+jvhy47uWpWN4QuQ/bTHR6llMcR1O/QmMoejSFuw0Gpp4upfkomzd1+gq4BfCcFdqY7ummHgMs6mrvPw+umHIox0MuuzkM1w3r4pXLXoO9vVNfe442bNOXbw/TbnaecHDSuHUI5I6O9k/ERDejcg52oNrQUB608Wkj3rs0hKrpuuxSYddPZnfYfrE7Wu/6O9k3l1apBT04bhSovGGnMUeZYqUuUJEUoxf/fMgpoDmsxlRTTqA69PcBN69TuDmvC/0N+89rgoK0FxTQJD5OE2d2wtjCsoD4BaTbZXCH6pA86O69I+hRNeLUabbl4zdnrg1EcylTSf0LGM1gO+vNdLYgwg6uix7rcQQlNK98cFL56w0qDNxxVTm08EH6DnGQNiLroiVXgJH9Mi9NaeSrA1/VBt3sLYd14SRdKsajb67SGTKdmKk1Flmlw6gksE3biJ5qSqMunreBb3fBwBPoTFk26qnJ7481RkLioKu8E6lszqpBYHHskz6Av2D0ctXxzz+JVz6mUr9zzrNhm7gycLaa1xxHAr6SJHWFMNXTNYrcKjetSHD4OKoPYWLLvnFuxIcIbw9oMCZqUW+HAXXicbPEEbdIGnbUVCaErPyj1DBtsdprRpTneKXcJNTfrgrNMiCQhWKPxcCpLJKrWho2nrhJdc60djobGtnWJs7xAWb+GcJGWEeOoQdqgX786E2X9itDPP+xSD6Pqh1If+EPUtPdIIZULMndse3f576gTGxaqqL7rvEYos3YterKTSxr+fM61tqj7DsL3GMSFp2n14w76O7vCKmOaWuUNXzsM0VGChc5BK/tiTVZ7HvH67xHAG8CzuY622d4wVFgc0WiRoJY6+pjWraVCs9koLNaGGTezoCy9Qou2u5ne7qCHSc+hX/+DyAB01bFC5xDYTH+tr7tttVMAnUWMJ2PpsuBa4EbvEAwjWydN6tEHiRHO/vgFWi3077wR3D8iSK47Vd2lEvTlaXiHJRYtptCzGaedWgw3OOeeCIqOVkbyjhcr5fJIQSUUmdhTrNRS7hZ9N3VDaf9D0YpZvv4EMu6ExdyUAfnSiCz/h9pSVYJ+1TIJ7ZqX0oZZvDz3kpNVXkr3j+hEbTu5gM+/5vLTcMF7mmhrMLlnlTJ8cGvo9ZDh7Dg7OCGOugr1eJaP/sll+fqClYl1oiisfKzYnhJ0e+aVif0R/W7nSYUDqi4CGkdHdqJX+tllfFaJ0r8eUU9bptOVMtp/yW7mM4MNQy30w+hoKn08njoLqiTfex2+HjrjMr5MHZAvjVnlydqgsxeRaIAvberWAVjNvj0Cf4jLMmTZ/R6MoYKn76J3YGWK1NzDQsoq5+fwsYg0rE041VMtzh/jzZq7w68Qpu5wfLop0RBa+LPT1+GaVjI9hQbdF1afelFVyi+iB7bk0/rBbSlU0NdbwVod18EVYeJa7KrNnppgM/HLYQDxs4pqUJsioXZqqPqKjv4LPp034WW0VapZZCE55HGw9B6z5bJYktOy8TU2oLxGhtPpB6Ipgl0DJtNSGFovbDxmcqsmNifTfprV804X6It3daQKyxETu/DcFBa/5+FDeatbhMIf7rmCsTs8tx/bmk/r9rk8mMZqBrGUNSSK0zfs4qTCkhS0rstv0rK0Amr+170krcmmxQddroCqeMiDevkljK5nILN7f38UBpIrQsSv7NqktjQeD7PGUkiFDWf7ey7LSchWDS6vrNfBf7ISRtNLCCw7KAXug6d+xELIxg8LcS53A+BehZYjRoRQoXFRGRUi+tRIcOWuGhRlC3Ck7Dkd3PEY6U2WGPQU+0yXpHuN1AlEmc5YJEXKApB0BarhOTjMWO3j35fxXQW4rQ5CdI2/ylXMeL786YBIeh4B8JpH8hDmyUK8qYrI3T4PEsdxDZWgH7riZV6MB+CXItXj7SRowUF+gauArS0HOCy2XWzVSL1UgekN0Ou9JgZ+bS5dvC5kAaCRVxGR+nhEdHAzzKpi/qYUA/3RWn2gYx1JVOUblpz30R2LoEjz1VnEi61IT8c0ofUPY4iBSzqqCmblfYscC5keYN1cjyX4S+rDnHfQOfbDqBxbetXd7l26Ru0BfFahy13AZdjgyhgP4MM1YwpuzQT0giwx6NgYW02U2EKZ86IZmPCWN4in+DU59KsQHOcmOMHpJGeWtdRNTvO2Nx/K22e6S1/zoQl/qoyDhSrSzrOuEJ8/7RKcaN1WZ9O3JxDSE6gNXAklY+Mo7jfuUSy/+vOqsqU5v9vKkXvVgH+FR6pAX44FUZfg3OLUa5tPnt26eoSA9Mivc2iJEIfl4pwzcxDJStWnUsrhzHn1gA75Kkb32Qt5+aQO6Cif81gscXISE+dGRq5DVpdKjCieAxxm0+GPOVhYTh/1wU74ypv8m1XKJGQOjINlG+SMgXCe6VVn+ShGYs6X/kLiJ7e48wyCFHAReKIlfVs7AecyLCq+HmQs3rI07RT123hUmeOINsbCw5k1EXLeh3xKT3wauG4D3S1waqCi30UmqED/hsNrOsQLoZrU6qb6vvj956yLFAZfj1ql5LetBLs2+nD6B/vm2UL25NPX68D4PZuPlRXj4M52+EbGtlcmjs2vAvQMZI31VM3IdK00DL3BY6Fuv/IgbUbkagiH+yqJ5fxP93Ukus9V+Qr8+ZwJnHK0iNZkXyS67p5jo9eVzr1Snuk6glSnqj+3WodTCyEsZ8vEqmIRnb6zgLIF/TsfRtAjqfnec1FaTkPXZtMyBlKHOBw4ColLq7G7o/iZO+0LrzqFRKe+zq2rPNNZrwqqP3ROtHKWr8uDaNFyaImcw2jq/FkmwkgNqTXelAJWB3XWAJ1Bw4MZSv1UNoJeeTbgeOGdjUy1aE5YrWKC6LXFePNMVyqzVdQw4/aTQjYAt7f4kCtjQLd9fjDIZSk4guwxXwGH62HjiI50pw/bbzphu03JmFj7jkFdRvVuSgy6bDyKoNeW0XuwCMX9QZwImgG5GSzqgLS74Sr7wFPfvCNwXZ6SN5b/50dFE+8G8Y2sFwA6zrwKIr2iSjb6Jh+ixddZ6wPf8xKU2Qerj2Hr/z8OkoQF9r9Vcj4cqXxj4K+XsMvjEPv5K4mzGY5ic4JN0/GapBye6bAwgkSQxdM6K70OS4RE02BwES/kr+cCyPHrDxGx+wHBkuehy/8suCLudiQwQbOK+SKb0s65Ep5YEfiONR5vSZIZdAlZAEEibOht18CVfXsDobhUZO4Gk1icOWg7Ayxuj8GtzcIiKebqELSe3v88RAWlLgNuBNsaQmq2sXFI2RbbMXpBos81Xm0T9V9Do0gVZnIf1vtVyTQDBS9kOmwDBcGRlrT1uOLSd4lehgWtN3MtlecWIhIcYAqrDYNImVj0xH73nRQB5oJ+jy0zjhkcD/GxnEUEp+VhF8i7g9vRIGFv68xMd10+F9syRaPMNtsdOwirZj6PZvU9wyojSNpWdXn/SkyNb6bI7jrCYTnWz4NNcJBN3eFKLn0WmxVkbJ+Xn06gP97p2tNk804WaGvTHxxQKnxJBrUhDHUzD9cOuixvDfTY/9BVuYC+z4xXU/obp2cM+uG4W0zVgcHynEs0ffNxj5B8yRqXQA+3MehFkSQbznantNW6mQK5nRuLjZhZywvoXzODax6oEfzx4HlqDs0p6TdNaFSr+tQS22uO4u17nXd1834mPSq8ZkvHcSwHHYyqjha7RLGDzidxJqdnoR/4Oc2nr7q3UjTKujFHd/wmOManoO1/IS8mn61Ubwn2wdbM87aPVwTAL2KrpGM3CKd/G6B99FIPm1yrlOn8p/y5gYreF4FLdnQ75QYu0xZQqKCf9I+k47AQba7ZIFJ94cwBMRPZIwt81GwluUCvkFNwDc4Nc+mj7i0V+T62gLGwf9Sv3grLbK85z7OtQ2Eh4mSMoBA0MXGrvC0rTZ+sJFtWOYq4QGcRw2fPmklQpZ5Tbdx9kXc5m0Vw9c751Z6lWwev+EXM+GBEgRIilQtn+oUqc3U2iYetCeIFSPBhvybSwp6tFGricSSB7shx13396fJNbK/ZXWnE8AlKZx9FfkuAw29vCAmvzPsKYaOy5lgk+rt4XQl6uPwP3MzTrOjtRcxy9Q7o2bsxy80+lQLu3kT4uG2BEBD7RGzAByq/BVsnRwum/wk+PEhf2zlGxUVrPIP+2143cErCfG/x1Sq/FNF3cYHhWb7OWy1Bq2Gta1gn+m865tw+ycBzfktCjPn5LV8MjFKMa86vsKp17Q35PXptmCLirpzpPKDSouX4eVprbIavYZb9Lk6pTUzHntIqo0OGO3AvuBcGzYgtec6TNXih2/dAJ3qZd/EZU+ncG1Vd6YUxiXuk2Pn1N41DIYRqp6nkikK08D130F8bhkRAKblKDnQKbOgfpdBY2Bf9baBmucDHDwfO0YRtyiNNPsAuvl8m4rw3A+fJ6AzJlhWWOgwakkDDt0ES68cC3sUsVyZWaoLOjV6rvQg/fXL5tkYo7n5VesUjWOxMl+UeEFr96xmKxxZK3p3noG7N69HN8XG0kEFTnz3joR3nZcRT2RHGWWGsITloLmZ4prAx2a0ZiTKpgbzM7TouuFpR301OH4pLm9SXdb/jlT7yVFfF2YhbcCjCUGTSBp2ahdHBUZ3cNvayN/0rhOBehe8nm30oWufBsH0Pb+NcOMOmQaSI22t4HJ/AVfD0BuyLYyNBm2SyWobQ7B6aPi3PoHNjC9NXQUiO127X/eofIVbe7eFKLGCWLAiF2SIz1UHId3wDC/pr2BygZTUyZrk4PyAXuz8uYENBA0T9W2ER7oE3Q70p2MH+W7AL3sBxWDqAc9FPcTLpZE9D1ged/xWOBfsfDZzFSJhZZZPiFafIJSOwO0vHW+eJKdOvQ6Ssv7ed4gxHb/vgzLCBW/OM+HjOU2hoAk3v5nFvpT7ozFlyxoPQif4Pf3kui9dxBw637CecPnQaK3vrTw+YmRnlLU7u5eEmWIM38RH4gmzHnBggPhbrjb3naTUWaQPaF94deTTN7MV4eSRjPS/IWAAXgccjSV7o3YY+6q0MWyVC5u2GGlcjqV4o9Ufy6EOQ292Q/9IxPBRyuxaVQd6chPczG9rWVliZKzjVzxvRKNG7+I8Cf6pqzMZA53NginF8NVEftwahk5cjAVOUmZwrwqkLtxXJtIvC5YHEBmYV5K6na1Xghqwh43ArX3Ebm6cycUa6CDjvGxqDqMxtRsfw38keNQI442IMdC7J/5JAlliNdEaT/3d4e+LgrkiD/pVnToDi1nlqFzAhR9BLvQxb8cZBZxBmJR7CdvaR+KuY9+BPRahLpEUIwWUbzUu8dUDV47SULPIoTEiv0liMyXR1tymZD10aG/t1E8FE+wU+5e6roJNXlX2rbuvW/V4MA+ghTwaQ3rC8m+mOlp7s8s38zAtTz123/08APo2iO0zv2whwDgoM9wVwhtC3mV4J/itpp5KeiW22MXZbfiinMN8WJNFxkiz30e97+Kye+QW6DeQvc6IpvygFj6/3bQD6TgqRx3qzaGph4pt4EVt6LPYwfPADYIm9icumB7a1mK6Ga+xGWgyvYZK/gDPv/s90EYEFaSOh3azApeDmQwT2KVyAqjwZmtt3ZnXj/0wXOZnVaz1ePyQGEsdab3Xi2Z0C51VXMwFnUMyd6SLMC9IHwfRaggeAsM0tR/wf2afTjETv4gkGhxk40JkB/m8o9cqm46+X8VHm1hlkMMjFOO3tfVvEx4APxVfeAgu6gysGv27ZBLxXr+MSMoJqHOVhZidTceH/aMU0zeY2OKA7uGZvZYllHFIWpuDSYHzMXVO8QwdnT8lbbAs/56Wo0iS8a8q70sEFXeTN/m+RJ2HgT2Bp6eod236V3gdt5DM8+JVm/xtjo1xVH+gihx/tbYlUhoG4NBTBkmH43cHoAAyUOw2xtgMPdzPdlL8nztmsZqoZoKtBWPBTBEmhcbC1kB8n4bgrmX/z3hQ+C4qzN7HRhzhFl7dEcAZ/MYDFGQfSOcxgaB7YpilbcnFYWpZerFLdbbC+/xsZb4aBao83bwAAAABJRU5ErkJggg==\"></h2><h2><br></h2><h2>Welcome!</h2><p><br></p><p>You can access the <strong>web application</strong> at <a href=\"http://app.mykonote.com\" target=\"_blank\">app.mykonote.com</a>.</p><p>The <strong>mobile application</strong> may be downloaded from the <a href=\"https://play.google.com/store/apps/details?id=com.mykonote\" target=\"_blank\">Play Store</a>.</p><p><br></p><p><br></p><h2>Data Privacy</h2><p><br></p><p>The app.mykonote.com server is <strong>hosted in Switzerland</strong> by <a href=\"https://www.panter.ch\" target=\"_blank\">Panter AG</a>.</p><p>All your data belongs to you.</p><p>Mykonote is <strong>free software</strong> (released under the <a href=\"https://www.gnu.org/licenses/agpl-3.0.html\" target=\"_blank\">GNU AGPL v3</a>) and is a <strong>free service offered by Panter AG</strong>.</p><p>There will <strong>never</strong> be any <strong>weird business</strong> going on <strong>with your data</strong>.</p><p><br></p><p><br></p><h2>Free plan</h2><p><br></p><p>You have been subscribed to the <strong>free plan</strong>. This means that you are <strong>limited </strong>to <strong>100 notes</strong>. Otherwise there's no difference to the pro subscription.</p><h2><br></h2><h2><br></h2><h2>And finally, some links</h2><p><br></p><ul><li><a href=\"https://github.com/panter/mykonote\" target=\"_blank\">Source code on GitHub</a></li><li><a href=\"https://github.com/panter/mykonote-app\" target=\"_blank\">Source code of Mobile App on GitHub</a></li><li><a href=\"https://www.panter.ch\" target=\"_blank\">Panter AG</a></li><li><a href=\"https://www.koffeinfrei.org/\" target=\"_blank\">Koffeinfrei</a></li></ul><p><br></p><p><br></p><p>Made with ♥ by <a href=\"https://github.com/koffeinfrei\" target=\"_blank\">Koffeinfrei</a> &amp; <a href=\"https://www.panter.ch\" target=\"_blank\">The Panters </a>in Mykonos, Greece and Impact Hub, Zurich</p>"
  # rubocop:enable Metrics/LineLength

  def initialize(user)
    @user = user
  end

  def run
    Note.create(
      title: TITLE,
      content: CONTENT.dup,
      uid: SecureRandom.uuid,
      user: @user
    )
  end
end
