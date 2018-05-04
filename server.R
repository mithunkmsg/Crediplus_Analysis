library(shiny)
library(dygraphs)
library(xts)


mydata<-read.csv("memberships_user2.csv")
mydata$week_date <- as.Date(mydata$week_date, format="%m/%d/%Y")

mydata2<-read.csv("not_mem_user3.csv")
mydata2$week_date <- as.Date(mydata2$week_date, format="%m/%d/%Y")


shinyServer(
  function(input,output){
    
    output$table<-renderDataTable({
      mydata
    })
    
    output$dygraph1<-renderDygraph({
      dy_xts<-xts(cbind(mydata$total_request,mydata$apply_promo_code,mydata$not_apply_promo_code,mydata$total_convert,
                        mydata$total_not_convert),order.by=as.Date(mydata$week_date))
      dygraph(dy_xts,xlab = "Week",ylab = "Number")%>%
        dySeries("V1",label="Total_Request",color="red", fillGraph = F, strokeWidth = 3, drawPoints = T,pointSize=3)%>%
        dySeries("V2",label="Total_Apply_Code_For_Membership",color="green", fillGraph = F, strokeWidth = 3, drawPoints = T,pointSize=3)%>%
        dySeries("V3",label="Total_Not_Apply_Code_For_Membership",color="yellow", fillGraph = F, strokeWidth = 3, drawPoints = T,pointSize=3)%>%
        dySeries("V4",label="Total_Convert",color="blue", fillGraph = F, strokeWidth = 3, drawPoints = T,pointSize=3)%>%
        dySeries("V5",label="Total_Not_Convert",color="purple", fillGraph = F, strokeWidth = 3, drawPoints = T,pointSize=3)%>%
        dyLegend(labelsDiv = "legendDivID",labelsSeparateLines = T)
    })
    
    output$dygraph2<-renderDygraph({
      dy_xts<-xts(cbind(mydata$total_apply_for_cashback,mydata$total_approved,mydata$total_dis_approved,mydata$total_invalid),order.by=as.Date(mydata$week_date))
      dygraph(dy_xts,xlab = "Week",ylab = "Number")%>%
        dySeries("V1",label="Total_Apply_For_Cashback",color="red", fillGraph = F, strokeWidth = 3, drawPoints = T,pointSize=3)%>%
        dySeries("V2",label="Total_Approved",color="green", fillGraph = F, strokeWidth = 3, drawPoints = T,pointSize=3)%>%
        dySeries("V3",label="Total_Dis_Approved",color="purple", fillGraph = F, strokeWidth = 3, drawPoints = T,pointSize=3)%>%
        dySeries("V4",label="Total_Invalid",color="blue", fillGraph = F, strokeWidth = 3, drawPoints = T,pointSize=3)%>%
        dyLegend(labelsDiv = "legendDivID",labelsSeparateLines = T)
    })
    
    output$dygraph3<-renderDygraph({
      dy_xts<-xts(cbind(mydata$apply_promo_code,mydata$total_promo_code_mem,mydata$total_crediweb_mem,mydata$total_link_mem,mydata$total_gift_mem),order.by=as.Date(mydata$week_date))
      dygraph(dy_xts,xlab = "Week",ylab = "Number")%>%
        dySeries("V1",label="Total_Apply_Code_For_Membership",color="red", fillGraph = F, strokeWidth = 3, drawPoints = T,pointSize=3)%>%
        dySeries("V2",label="Total_Mem_Through_Promo_Code",color="green", fillGraph = F, strokeWidth = 3, drawPoints = T,pointSize=3)%>%
        dySeries("V3",label="Total_Mem_Through_Credi+website",color="purple", fillGraph = F, strokeWidth = 3, drawPoints = T,pointSize=3)%>%
        dySeries("V4",label="Total_Mem_Through_Link",color="blue", fillGraph = F, strokeWidth = 3, drawPoints = T,pointSize=3)%>%
        dySeries("V5",label="Total_Mem_Through_Gift",color="yellow", fillGraph = F, strokeWidth = 3, drawPoints = T,pointSize=3)%>%
        dyLegend(labelsDiv = "legendDivID2",labelsSeparateLines = T)
    })
    
    output$dygraph4<-renderDygraph({
      dy_xts<-xts(cbind(mydata2$total_request,mydata2$total_converted,mydata2$total_not_converted),order.by=as.Date(mydata2$week_date))
      dygraph(dy_xts,xlab = "Week",ylab = "Number",main = "Trend Graph For Non_Credi_Mem_User")%>%
        dySeries("V1",label="Total_Request",color="red", fillGraph = F, strokeWidth = 3, drawPoints = T,pointSize=3)%>%
        dySeries("V2",label="Total_Converted",color="green", fillGraph = F, strokeWidth = 3, drawPoints = T,pointSize=3)%>%
        dySeries("V3",label="Total_Not_Converted",color="purple", fillGraph = F, strokeWidth = 3, drawPoints = T,pointSize=3)%>%
        dyLegend(labelsDiv = "legendDivID3",labelsSeparateLines = T)
    })
    
    output$dygraph5<-renderDygraph({
      dy_xts<-xts(cbind(mydata$total_request,mydata$total_convert,mydata$total_not_convert),order.by=as.Date(mydata$week_date))
      dygraph(dy_xts,xlab = "Week",ylab = "Number",main = "Trend Graph For Credi_Mem_User")%>%
        dySeries("V1",label="Total_Request",color="red", fillGraph = F, strokeWidth = 3, drawPoints = T,pointSize=3)%>%
        dySeries("V2",label="Total_Converted",color="green", fillGraph = F, strokeWidth = 3, drawPoints = T,pointSize=3)%>%
        dySeries("V3",label="Total_Not_Converted",color="purple", fillGraph = F, strokeWidth = 3, drawPoints = T,pointSize=3)%>%
        dyLegend(labelsDiv = "legendDivID3",labelsSeparateLines = T)
    })
    
    
  }
)