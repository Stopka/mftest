<?php
/**
 * Created by IntelliJ IDEA.
 * User: stopka
 * Date: 31.3.19
 * Time: 14:07
 */

namespace Stopka\MediaFactory\Model\Database\Entities;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Mapping as ORM;
use Stopka\MediaFactory\Model\Database\Entities\Properties\TIdentificationProperties;
use Stopka\MediaFactory\Model\Database\Entities\Properties\TInternalNameProperty;

/**
 * Class ProductTypeEntity
 * @package Stopka\MediaFactory\Model\Database\Entities
 * @ORM\Entity()
 */
class ProductTypeEntity
{
    use TIdentificationProperties;
    use TInternalNameProperty {
        __construct as private initializeInternalName;
    }

    /**
     * @var ProductParameterEntity[]
     * @ORM\OneToMany(targetEntity="ProductParameterEntity", mappedBy="productType", cascade={"all"}, orphanRemoval=true, indexBy="field_id")
     */
    private $productParameters;

    public function __construct(string $internalName)
    {
        $this->initializeInternalName($internalName);
        $this->productParameters = new ArrayCollection();
    }

    public function addField(FieldEntity $field)
    {
        if (!$this->productParameters->containsKey($field->getId()->getBytes())) {
            $parameter = new ProductParameterEntity($this, $field);
            $this->productParameters->set($field->getId()->getBytes(), $parameter);
        }
    }

    public function createDefaultProductValue(ProductEntity $product, FieldEntity $field): ?ProductParameterValueEntity
    {
        $parameter = $this->productParameters->get($field->getId()->getBytes());
        if (!$parameter) {
            return null;
        }
        return new ProductParameterValueEntity($product, $parameter);
    }

    /**
     * @return FieldEntity[]
     */
    public function getFields(): array
    {
        return $this->productParameters->map(function (ProductParameterEntity $productParameter) {
            return $productParameter->getField();
        })->toArray();
    }

}
