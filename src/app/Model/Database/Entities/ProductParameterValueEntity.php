<?php
/**
 * Created by IntelliJ IDEA.
 * User: stopka
 * Date: 31.3.19
 * Time: 14:48
 */

namespace Stopka\MediaFactory\Model\Database\Entities;


use Doctrine\ORM\Mapping as ORM;
use Stopka\MediaFactory\Model\Database\Entities\Properties\TIdentificationProperties;

/**
 * Class ProductParameterValueEntity
 * @package Stopka\MediaFactory\Model\Database\Entities
 * @ORM\Entity()
 */
class ProductParameterValueEntity
{
    use TIdentificationProperties;

    /**
     * @var ProductEntity
     * @ORM\ManyToOne(targetEntity="ProductEntity")
     */
    private $product;

    /**
     * @var ProductParameterEntity
     * @ORM\ManyToOne(targetEntity="ProductParameterEntity")
     */
    private $productParameter;

    /**
     * @var FieldEntity
     * @ORM\ManyToOne(targetEntity="FieldEntity")
     */
    private $field;

    /**
     * @var FieldValueEntity
     * @ORM\OneToOne(targetEntity="FieldValueEntity", cascade={"all"})
     */
    private $fieldValue;

    public function __construct(
        ProductEntity $product,
        ProductParameterEntity $productParameter
    ) {
        $this->product = $product;
        $this->productParameter = $productParameter;
        $this->fieldValue = clone $productParameter->getField()->getDefaultValue();
        $this->field = $productParameter->getField();
    }

    /**
     * @return FieldEntity
     */
    public function getField(): FieldEntity
    {
        return $this->field;
    }

    /**
     * @return ProductEntity
     */
    public function getProduct(): ProductEntity
    {
        return $this->product;
    }

    /**
     * @return ProductParameterEntity
     */
    public function getProductParameter(): ProductParameterEntity
    {
        return $this->productParameter;
    }

    /**
     * @return FieldValueEntity
     */
    public function getFieldValue(): FieldValueEntity
    {
        return $this->fieldValue;
    }


}
