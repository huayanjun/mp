package ${package.Controller};

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import ${package.Service}.${table.serviceName};
import ${package.Entity}.${entity};

<#if restControllerStyle>
import org.springframework.web.bind.annotation.RestController;
<#else>
import org.springframework.stereotype.Controller;
</#if>
<#if superControllerClassPackage??>
import ${superControllerClassPackage};
</#if>

import java.util.List;

/**
 * <p>
 * ${table.comment!} 前端控制器
 * </p>
 *
 * @author ${author}
 * @since ${date}
 */
@Slf4j
@Api(tags = "${table.controllerName}")
<#if restControllerStyle>
@RestController
<#else>
@Controller
</#if>
@RequestMapping("<#if package.ModuleName??>/${package.ModuleName}</#if>/<#if controllerMappingHyphenStyle??>${controllerMappingHyphen}<#else>${table.entityPath}</#if>")
<#if kotlin>
class ${table.controllerName}<#if superControllerClass??> : ${superControllerClass}()</#if>
<#else>
<#if superControllerClass??>
public class ${table.controllerName} extends ${superControllerClass} {
<#else>
public class ${table.controllerName} {

    @Autowired
    private ${table.serviceName} ${table.serviceName?uncap_first};

    @ApiOperation(value = "查询分页数据")
    @RequestMapping(value = "/listBy")
    public Page<${entity}> findListByPage(@RequestParam(name = "pageNum", defaultValue = "1") int pageNum, @RequestParam(name = "pageSize", defaultValue = "10") int pageSize){
        Page<${entity}> page= new Page<>(pageNum,pageSize);
        return ${table.serviceName?uncap_first}.page(page);
        }

    @GetMapping("/list")
    @ApiOperation("获取全部列表")
    public List<${entity}> findAll(){
    return ${table.serviceName?uncap_first}.list();
    }

    @GetMapping("/get")
    @ApiOperation("根据id获取对象")
    public ${entity} getOne(Long id){
    return ${table.serviceName?uncap_first}.getById(id);
    }

    @PostMapping("/delete")
    @ApiOperation("根据id删除,批量")
    public boolean delete(List<Long> ids){
     return  ${table.serviceName?uncap_first}.removeByIds(ids);
     }


    @PostMapping("/save")
    @ApiOperation("保存对象")
    public boolean save(${entity} ${entity?uncap_first}){
    return  ${table.serviceName?uncap_first}.save(${entity?uncap_first});
    }

    @PostMapping( "/update")
    @ApiOperation(value = "更新数据")
    public boolean update(@RequestBody ${entity} ${entity?uncap_first}){
    return  ${table.serviceName?uncap_first}.updateById(${entity?uncap_first});
    }



</#if>

}
</#if>
