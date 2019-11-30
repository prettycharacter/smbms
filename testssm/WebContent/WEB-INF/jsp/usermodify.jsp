<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="common/head.jsp"%>
    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>用户管理页面 >> 用户修改页面</span>
        </div>
        <div class="providerAdd">
        <form id="userForm" name="userForm" method="post" action="${pageContext.request.contextPath }/user/usermodifysave"
                enctype="multipart/form-data">
			<input type="hidden" name="method" value="modifyexe">
			<input type="hidden" name="id" value="${user.id }"/>
			 <div>
                    <label for="userName">用户名称：</label>
                    <input type="text" name="userName" id="userName" value="${user.userName }"> 
					<font color="red"></font>
             </div>
			 <div>
                    <label >用户性别：</label>
                    <select name="gender" id="gender">
						<c:choose>
							<c:when test="${user.gender == 1 }">
								<option value="1" selected="selected">男</option>
					    		<option value="2">女</option>
							</c:when>
							<c:otherwise>
								<option value="1">男</option>
					    		<option value="2" selected="selected">女</option>
							</c:otherwise>
						</c:choose>
					 </select>
             </div>
			 <div>
                    <label for="data">出生日期：</label>
                    <input type="text" Class="Wdate" id="birthday" name="birthday" value="<fmt:formatDate value="${user.birthday}" pattern="yyyy-MM-dd"/>"
					readonly="readonly" onclick="WdatePicker();">
                    <font color="red"></font>
              </div>
			
		       <div>
                    <label for="userphone">用户电话：</label>
                    <input type="text" name="phone" id="phone" value="${user.phone }"> 
                    <font color="red"></font>
               </div>
                <div>
                    <label for="userAddress">用户地址：</label>
                    <input type="text" name="address" id="address" value="${user.address }">
                </div>
				<div>
                    <label >用户角色：</label>
                    <!-- 列出所有的角色分类 -->
					<input type="hidden" value="${user.userRole}" id="rid"/>
					<select name="userRole" id="userRole"></select>
        			<font color="red"></font> 
        			<%-- <select name="userRole" id="userRole">
        				<option value="1" <c:if test="${user.userRole==1}">selected="selected"</c:if>>系统管理员</option>
        				<option value="2" <c:if test="${user.userRole==2}">selected="selected"</c:if>>经理</option>
        				<option value="3" <c:if test="${user.userRole==3}">selected="selected"</c:if>>普通用户</option>
        			</select> --%>
                </div>
                 <div>
                 <c:choose>
                 <c:when test="${user.idPicPath==null||user.idPicPath==''}">
                   <input type="hidden" name="uploadError" id="uploadError" value="${uploadError }"/>
                    <label for="_idPicPath">证件照：</label>
                    <input type="file" name="attachs" id="_idPicPath" value=""> 
					<font color="red"></font>
				</c:when>
				<c:otherwise>
						<img src="${user.idPicPath}" width="500px" height="300px" alt="工作证图片"/>
				</c:otherwise>
				</c:choose>
                </div>
                
                <c:choose>
                 <c:when test="${user.workPicPath==null||user.workPicPath==''}">
                 <div>
                   <input type="hidden" name="uploadError" id="uploadError" value="${uploadError }"/>
                    <label for="_workPicPath">营业执照：</label>
                    <input type="file" name="attachs" id="_workPicPath" value=""> 
					<font color="red"></font>
					</div>
				</c:when>
				<c:otherwise>
				<div>
				  <img src="${user.workPicPath}" width="500px" height="300px" alt="营业执照图片"/>
				  </div>
				</c:otherwise>
				</c:choose>
			 <div class="providerAddBtn">
                    <input type="button" name="save" id="save" value="保存" />
                    <input type="button" id="back" name="back" value="返回"/>
                </div>
            </form>
        </div>
    </div>
</section>
<%@include file="common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/usermodify.js"></script>
