<?php
/**
 * Created by IntelliJ IDEA.
 * User: stopka
 * Date: 31.3.19
 * Time: 14:28
 */

namespace Stopka\MediaFactory\Model\Database\Entities;


use Doctrine\ORM\Mapping as ORM;
use Stopka\MediaFactory\Model\Database\Entities\Properties\TIdentificationProperties;

/**
 * Class ProductParameterEntity
 * @package Stopka\MediaFactory\Model\Database\Entities
 * @ORM\Entity()
 */
class ProductParameterEntity
{
    use TIdentificationProperties;

    /**
     * @var ProductTypeEntity
     * @ORM\ManyToOne(targetEntity="ProductTypeEntity")
     */
    private $productType;

    /**
     * @var FieldEntity
     * @ORM\ManyToOne(targetEntity="FieldEntity")
     */
    private $field;

    public function __construct(ProductTypeEntity $productType, FieldEntity $field)
    {
        $this->productType = $productType;
        $this->field = $field;
    }

    /**
     * @return ProductTypeEntity
     */
    public function getProductType(): ProductTypeEntity
    {
        return $this->productType;
    }

    /**
     * @return FieldEntity
     */
    public function getField(): FieldEntity
    {
        return $this->field;
    }


}
