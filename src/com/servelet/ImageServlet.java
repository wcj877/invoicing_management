//package com.servelet;
//
//import org.jfree.chart.ChartFactory;
//import org.jfree.chart.JFreeChart;
//import org.jfree.chart.plot.CategoryPlot;
//import org.jfree.chart.plot.PlotOrientation;
//import org.jfree.chart.renderer.category.LineAndShapeRenderer;
//import org.jfree.chart.servlet.ServletUtilities;
//import org.jfree.data.category.CategoryDataset;
//import org.jfree.data.category.DefaultCategoryDataset;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.awt.*;
//import java.io.IOException;
//import java.util.Random;
//
///**
// * 使用JFreeChart绘制2D和3D折线图
// * @create Jun 25, 2013 9:58:11 PM
// * @author 玄玉<http://blog.csdn.net/jadyer>
// */
//@WebServlet(name = "ImageServlet", urlPatterns = "/ImageServlet")
//public class ImageServlet extends HttpServlet {
//    private                                                                                                                                                               static final long serialVersionUID = -2942367547538171657L;
//
//    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        //显示样式(是否为3D效果)
//        String style = request.getParameter("style");
//        //生成的折线图的文件名
//        String imageName = null;
//        if(null!=style && "3D".equals(style)){
//            //ChartUtilities.writeChartAsJPEG()是面向Java Application的
//            //ServletUtilities.saveChartAsPNG()是面向Web开发的
//            imageName = ServletUtilities.saveChartAsJPEG(createChart(true), 500, 300, request.getSession());
//        }else{
//            //saveChartAsPNG()的返回值是生成的图片的名字,它所生成的图片会保存在服务器的临时目录下
//            //Tomcat6的临时目录是D:/Develop/apache-tomcat-6.0.36/temp/目录
//            imageName = ServletUtilities.saveChartAsJPEG(createChart(false), 500, 300, request.getSession());
//        }
//        //获取图片的路径(此时JFreechart会根据filename到服务器的临时目录中寻找图片)
//        String imageURL = request.getContextPath() + "/servlet/DisplayChart?filename=" + imageName;
//        request.setAttribute("imageURL", imageURL);
//        request.getRequestDispatcher("/statistics.jsp").forward(request, response);
//    }
//
//
//    /**
//     * 创建数据集
//     */
//    private CategoryDataset createDataSet() {
//        //图例名称
//        String[] line = {"kaspersky", "Nod32", "360"};
//        //类别
//        String[] category = {"2008年", "2009年", "2010年", "2011年", "2012年"};
//        DefaultCategoryDataset dataSet = new DefaultCategoryDataset();
//        //向数据集中添加数据
//        for(int i=0; i<line.length; i++){
//            for(int j=0; j<category.length; j++){
//                dataSet.addValue(100000 + new Random().nextInt(100000), line[i], category[j]);
//            }
//        }
//        return dataSet;
//    }
//    /**
//     * 生成制图对象
//     * @param is3D 是否为3D效果
//     */
//    private JFreeChart createChart(boolean is3D){
//        JFreeChart chart = null;
//        if(is3D){
//            //图表标题,X轴标题,Y轴标题,绘图数据集,绘制方向,显示图例,采用标准生成器,生成链接
//            chart = ChartFactory.createLineChart3D("2008-2012年优秀杀毒软件杀毒数量统计", "杀毒软件", "查杀病毒数量",
//                    this.createDataSet(), PlotOrientation.VERTICAL, true, true, false);
//        }else{
//            chart = ChartFactory.createLineChart("2008-2012年优秀杀毒软件杀毒数量统计", "杀毒软件", "查杀病毒数量",
//                    this.createDataSet(), PlotOrientation.VERTICAL, true, true, false);
//        }
//        chart.getTitle().setFont(new Font("隶书", Font.BOLD, 23));      //设置标题字体
//        chart.getLegend().setItemFont(new Font("宋体", Font.BOLD, 15)); //设置图例类别字体
//        chart.setBackgroundPaint(new Color(192, 228, 106));            //设置背景色
//        CategoryPlot plot = chart.getCategoryPlot();                           //获取绘图区对象
//        plot.getDomainAxis().setLabelFont(new Font("宋体", Font.BOLD, 15));     //设置横轴字体
//        plot.getDomainAxis().setTickLabelFont(new Font("宋体", Font.BOLD, 15)); //设置坐标轴标尺值字体
//        plot.getRangeAxis().setLabelFont(new Font("宋体", Font.BOLD, 15));      //设置纵轴字体
//        plot.setBackgroundPaint(Color.WHITE);   //设置绘图区背景色
//        plot.setRangeGridlinePaint(Color.RED);  //设置水平方向背景线颜色
//        plot.setRangeGridlinesVisible(true);    //设置是否显示水平方向背景线,默认值为true
//        plot.setDomainGridlinePaint(Color.RED); //设置垂直方向背景线颜色
//        plot.setDomainGridlinesVisible(true);   //设置是否显示垂直方向背景线,默认值为false
//        LineAndShapeRenderer renderer = (LineAndShapeRenderer)plot.getRenderer(); //获取折线对象
//        BasicStroke realLine = new BasicStroke(1.6f); //设置实线
//        float dashes[] = {8.0f};                      //定义虚线数组
//        //线条粗细,端点风格,折点风格,折点处理办法,虚线数组,虚线偏移量
//        BasicStroke brokenLine = new BasicStroke(1.6f, BasicStroke.CAP_SQUARE, BasicStroke.JOIN_MITER, 8.0f, dashes, 0.0f);
//        renderer.setSeriesStroke(1, brokenLine); //利用虚线绘制
//        renderer.setSeriesStroke(2, brokenLine); //利用虚线绘制
//        renderer.setSeriesStroke(3, realLine);   //利用实线绘制
//        return chart;
//    }
//}
//
//
//
//
//    //获取图片的路径(此时JFreechart会根据filename到服务器的临时目录中寻找图片)
////    String imageURL = request.getContextPath() + "/servlet/DisplayChart?filename=" + imageName;
////        request.setAttribute("imageURL", imageURL);
////                request.getRequestDispatcher("/statistics.jsp").forward(request, response);